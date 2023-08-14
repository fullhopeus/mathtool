-- Return the list of valid controllers
function controller_names(channel)
	-- Tranzport sends only _one_ controller for the wheel
	if channel == 0 then
		return {
				[0x18] = 'Knob A 1',             
				[0x19] = 'Knob A 2',             
				[0x1A] = 'Knob A 3',  	          
				[0x1B] = 'Knob A High',          
				[0x1C] = 'Knob A Mid',           
				[0x1D] = 'Knob A Low',           
				[0x0C] = 'Fader A Pitch',        
				[0x0B] = 'Fader A Volume',       

				[0x22] = 'Knob B High',              
				[0x23] = 'Knob B Mid',               
				[0x24] = 'Knob B Low',    	          
				[0x1F] = 'Knob B 1',  
				[0x20] = 'Knob B 2',  
				[0x21] = 'Knob B 3',  
				[0x0F] = 'Fader B Pitch',        
				[0x0E] = 'Fader B Volume',       

				[0x11] = 'Crossfader left to right',
				[0x14] = 'Crossfader right to left',
				}
	else
		return {}
	end
end

-- Return the list of valid controllers
function controller_note_names(channel)
	if channel == 0 then
		return { -- Transport
				[0x2C] = 'Button A Headphone',   
				[0x2E] = 'Button A Reverse',     
				[0x2B] = 'Button A Forward',     
				[0x46] = 'Button A Start/Pause', 
				[0x3A] = 'Button A Cue',         

				[0x2D] = 'Button B Headphone',   
				[0x38] = 'Button B Reverse',     
				[0x39] = 'Button B Forward',     
				[0x45] = 'Button B Start/Pause', 
				[0x3B] = 'Button B Cue',         
				}
	else
		return {}
	end
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'X-Session Pro',
		-- manufacturer name for this device
		manufacturer = 'Evolution',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = '<no preset>',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x4D,0x14,0x71,0x01,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,

		-- don't play notes from this device
		ignore_notes = true,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Fader B Volume',       objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},

				{name='Knob A 1',             objectType='Knob', midi={0xB0,0x18,MIDI_LSB}},
				{name='Knob A 2',             objectType='Knob', midi={0xB0,0x19,MIDI_LSB}},
				{name='Knob A 3',  	          objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Knob A High',          objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Knob A Mid',           objectType='Knob', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Knob A Low',           objectType='Knob', midi={0xB0,0x1D,MIDI_LSB}},
				{name='Fader A Pitch',        objectType='Knob', midi={0xB0,0x1E,MIDI_LSB}},
				{name='Fader A Volume',       objectType='Knob', midi={0xB0,0x1F,MIDI_LSB}},
				
				{name='Knob B High',          objectType='Knob', midi={0xB0,0x10,MIDI_LSB}},
				{name='Knob B Mid',           objectType='Knob', midi={0xB0,0x11,MIDI_LSB}},
				{name='Knob B Low',   	      objectType='Knob', midi={0xB0,0x12,MIDI_LSB}},
				{name='Knob B 1',             objectType='Knob', midi={0xB0,0x13,MIDI_LSB}},
				{name='Knob B 2',             objectType='Knob', midi={0xB0,0x14,MIDI_LSB}},
				{name='Knob B 3',             objectType='Knob', midi={0xB0,0x15,MIDI_LSB}},
				{name='Fader B Pitch',        objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},

				{name='Button A Headphone',   objectType='Button', midiType='Note', midi={0x90,0x2C,MIDI_LSB}},
				{name='Button A Reverse',     objectType='Button', midiType='Note', midi={0x90,0x2E,MIDI_LSB}},
				{name='Button A Forward',     objectType='Button', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},
				{name='Button A Start/Pause', objectType='Button', midiType='Note', midi={0x90,0x46,MIDI_LSB}},
				{name='Button A Cue',         objectType='Button', midiType='Note', midi={0x90,0x3A,MIDI_LSB}},
				
				{name='Button B Headphone',   objectType='Button', midiType='Note', midi={0x90,0x2D,MIDI_LSB}},				
				{name='Button B Reverse',     objectType='Button', midiType='Note', midi={0x90,0x38,MIDI_LSB}},
				{name='Button B Forward',     objectType='Button', midiType='Note', midi={0x90,0x39,MIDI_LSB}},
				{name='Button B Start/Pause', objectType='Button', midiType='Note', midi={0x90,0x45,MIDI_LSB}},
				{name='Button B Cue',         objectType='Button', midiType='Note', midi={0x90,0x3B,MIDI_LSB}},

				{name='Crossfader left to right', objectType='VFader', midi={0xB0,0x11,MIDI_LSB}},
				{name='Crossfader right to left', objectType='VFader', midi={0xB0,0x14,MIDI_LSB}},
			}
		}
end
