
// ----------------------------------------------------------------
// sample table for jitters
// TODO: generate and pass in for better quality?
// TODO: random rotate for fewer artifacts.
// ----------------------------------------------------------------
const int numPoissonSamples = 16;
const vec2 poissonSamples[numPoissonSamples] =
    vec2[numPoissonSamples](
                        vec2(  -0.94201624, -0.39906216  ),
                        vec2( 0.94558609, -0.76890725 ),
                        vec2( -0.094184101, -0.92938870 ),
                        vec2( 0.34495938, 0.29387760 ),
                        vec2( -0.91588581, 0.45771432 ),
                        vec2( -0.81544232, -0.87912464 ),
                        vec2( -0.38277543, 0.27676845 ),
                        vec2( 0.97484398, 0.75648379 ),
                        vec2( 0.44323325, -0.97511554 ),
                        vec2( 0.53742981, -0.47373420 ),
                        vec2( -0.26496911, -0.41893023 ),
                        vec2( 0.79197514, 0.19090188 ),
                        vec2( -0.24188840, 0.99706507 ),
                        vec2( -0.81409955, 0.91437590 ),
                        vec2( 0.19984126, 0.78641367 ),
                        vec2( 0.14383161, -0.14100790 )
                        );

// ----------------------------------------------------------------
// pcf jitter sample.
// ----------------------------------------------------------------
float jitterPCF_withSpin(float depth_receiver, vec2 center, float spin,
                         float blurRadius, sampler2D shadowMap )
{
    float shadow = 0.0;
    
    const float _2pi = 2.0 * 3.14159;
    float ct = cos(spin * _2pi);
    float st = sin(spin * _2pi);
    
    for (int i=0; i < numPoissonSamples;  ++i)
    {
        vec2 delta = blurRadius * poissonSamples[ i ];
        
        vec2 jitter = vec2(ct*delta.x + st*delta.y, -st*delta.x + ct*delta.y );
        
        vec2 theSample = jitter + center;
        
        float z_shadow = texture2D( shadowMap, theSample ).r;
        
        if (depth_receiver < z_shadow)
        {
            shadow += 1.0;
        }
    }

    shadow /= float(numPoissonSamples) ;
    
    return shadow;
}



// ----------------------------------------------------------------
// get shadow from a light's cube map
// ----------------------------------------------------------------
float sampleCubeShadow(vec3 shadowCoord, mat4 lightProjectionMatrix, samplerCubeShadow shadowMap)
{
    // determine which octant we're in
    //
    vec3 absPos = abs(shadowCoord);
    float fs_z = -max(absPos.x, max(absPos.y, absPos.z));
    
    vec4 clip = lightProjectionMatrix * vec4(0.0, 0.0, fs_z, 1.0);
    float depth = (clip.z / clip.w) * 0.5 + 0.5;

    // Bias -- glPolygonOffset might be better.
    // depth -= 0.02;
    depth *= 0.98;
    
    vec4 result = shadowCube( shadowMap, vec4( shadowCoord.xyz, depth ));
    return result.x;
}
 

// ----------------------------------------------------------------
// get shadow from a light's cube map
// ----------------------------------------------------------------
float sampleCubeShadowJitter(vec3 shadowCoord,
                             vec2 blurRadius,
                             mat4 lightProjectionMatrix,
                             samplerCubeShadow shadowMap,
                             sampler2D noiseMap)
{
    // early out for too small blur.
    if (blurRadius.x < 1e-4) {
        return sampleCubeShadow( shadowCoord, lightProjectionMatrix, shadowMap );
    }
    
    vec4 clip = lightProjectionMatrix * vec4( shadowCoord, 1.0 );
    vec4 center = clip / clip.w;
    
    vec2 uv = 20.0*center.xy;
    uv.x = mod(abs(uv.x), 1.0);
    uv.y = mod(abs(uv.y), 1.0);
    float spin = texture2D(noiseMap, uv).x;

    
    const float _2pi = 2.0 * 3.14159;
    float ct = cos(spin * _2pi);
    float st = sin(spin * _2pi);
    
    // which octant ... assume the same across all jittered samples.
    //
    vec3 absPos = abs(shadowCoord);
    float fs_z = -max(absPos.x, max(absPos.y, absPos.z));
    clip = lightProjectionMatrix * vec4(0.0, 0.0, fs_z, 1.0);
    float depth = (clip.z / clip.w) * 0.5 + 0.5;

    // 
    float shadow = 0.0;
    
    for (int i=0; i < numPoissonSamples;  ++i)
    {
        vec2 delta = blurRadius * poissonSamples[ i ];
        
        vec2 jitter = vec2(ct*delta.x + st*delta.y, -st*delta.x + ct*delta.y );
        
        // send back to eyeSpace.
        jitter *= clip.w;
        
        vec3 esSample = shadowCoord + vec3(jitter.x,jitter.y,0.0);
        
        shadow += shadowCube( shadowMap, vec4(esSample.xyz, depth )).x;
    }

    shadow /= float(numPoissonSamples) ;
    
    return shadow;
}



// ----------------------------------------------------------------
//  get shadow from a light's depth map
// ----------------------------------------------------------------
float sampleShadowJitter(vec3 shadowCoord, vec2 texPerPixel,
                        sampler2D shadowMap, sampler2D noiseMap)
{
    // check for bounds
    //
    if (shadowCoord.x < 0.0 || shadowCoord.x > 1.0 || shadowCoord.y < 0.0 || shadowCoord.y > 1.0)
        return 1.0;

    vec2 uv = 20.0*shadowCoord.xy;
    uv.x = mod(abs(uv.x),1);
    uv.y = mod(abs(uv.y),1);
    vec3 rnd = texture2D(noiseMap, uv).xyz;

    
    float depth_receiver = shadowCoord.z;
    vec2 center = vec2( shadowCoord.x, shadowCoord.y );
    float blurRadius = 2.0 * texPerPixel.x;
    
    float s = jitterPCF_withSpin(depth_receiver, center, rnd.x,
                                 blurRadius, shadowMap );
    return s;
}



// ----------------------------------------------------------------
// check if this fragment is in front of the depthmap value
// ----------------------------------------------------------------
float depthPeel(vec3 screenNDC, sampler2D depthMap)
{
    float depth = texture2D(depthMap, screenNDC.xy).r;
    
    float zEpsilon = 0.001 * (1. - depth*depth);
    
    if (screenNDC.z - zEpsilon < depth)
    {
        discard;
        return 0.0;
    }
    
    return 1.0;
}

vec2 screenFragCoord()
{
    return gl_FragCoord.xy;
}

