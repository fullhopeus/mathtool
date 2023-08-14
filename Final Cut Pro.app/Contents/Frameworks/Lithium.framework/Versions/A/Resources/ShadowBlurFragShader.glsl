// blur fragment shader

// ProGL -- uniform sampler2D texture;
// ProGL -- uniform vec2 directionUV;
// ProGL -- uniform bool preserveEnergy;

const int N = 7;
const float kernel[N] =
   float[N]( 0.015625, 0.09375, 0.234375, 0.3125, 0.234375, 0.09375, 0.015625 );

void main()
{
	vec4 color = vec4(0.0);
    
    for( int i = 0;  i < N;  i++ )
    {
        vec2 delta = (i - (N-1)/2) * directionUV;
        color += kernel[i] * texture2D( texture, gl_TexCoord[0].st + delta );
    }
    
    if (preserveEnergy) {
        gl_FragColor = color;
    } else {
        vec4 current = texture2D( texture, gl_TexCoord[0].st );
        gl_FragColor = max( color, current );
    }
}


