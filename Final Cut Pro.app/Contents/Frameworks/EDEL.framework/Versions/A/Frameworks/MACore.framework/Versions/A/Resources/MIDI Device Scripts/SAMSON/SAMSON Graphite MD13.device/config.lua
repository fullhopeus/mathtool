-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'SAMSON Graphite MD13',
		-- manufacturer name for this device
		manufacturer = 'SAMSON',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'P1',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
--		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x42,0x02,0x01,0x00,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Keyboard', label='SAMSON Graphite MD13', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=13, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Volume', label='Volume', objectType='HFader',midi={0xB0,22,MIDI_LSB}},

				{name='Knob 1', label='E1', objectType='Knob',midi={0xB0,16,MIDI_LSB}},
				{name='Knob 2', label='E2', objectType='Knob',midi={0xB0,17,MIDI_LSB}},
				{name='Knob 3', label='E3', objectType='Knob',midi={0xB0,18,MIDI_LSB}},
				{name='Knob 4', label='E4', objectType='Knob',midi={0xB0,19,MIDI_LSB}},
				{name='Knob 5', label='E5', objectType='Knob',midi={0xB0,20,MIDI_LSB}},
				{name='Knob 6', label='E6', objectType='Knob',midi={0xB0,21,MIDI_LSB}},

				{name='CC 1', label='P1', objectType='Button', midiType='Momentary', midi={0xB0,36,MIDI_LSB}},
				{name='CC 2', label='P2', objectType='Button', midiType='Momentary', midi={0xB0,37,MIDI_LSB}},
				{name='CC 3', label='P3', objectType='Button', midiType='Momentary', midi={0xB0,38,MIDI_LSB}},
				{name='CC 4', label='P4', objectType='Button', midiType='Momentary', midi={0xB0,39,MIDI_LSB}},
				{name='CC 5', label='P5', objectType='Button', midiType='Momentary', midi={0xB0,40,MIDI_LSB}},
				{name='CC 6', label='P6', objectType='Button', midiType='Momentary', midi={0xB0,41,MIDI_LSB}},
				{name='CC 7', label='P7', objectType='Button', midiType='Momentary', midi={0xB0,42,MIDI_LSB}},
				{name='CC 8', label='P8', objectType='Button', midiType='Momentary', midi={0xB0,43,MIDI_LSB}},
				{name='CC 9', label='P9', objectType='Button', midiType='Momentary', midi={0xB0,44,MIDI_LSB}},				
				{name='CC10', label='P10', objectType='Button', midiType='Momentary', midi={0xB0,45,MIDI_LSB}},				
				{name='CC11', label='P11', objectType='Button', midiType='Momentary', midi={0xB0,46,MIDI_LSB}},				
				{name='CC12', label='P12', objectType='Button', midiType='Momentary', midi={0xB0,47,MIDI_LSB}},				
				{name='CC13', label='P13', objectType='Button', midiType='Momentary', midi={0xB0,48,MIDI_LSB}},	
				
				{name='Stop', label='Stop', objectType='Button', midiType='Toggle', midi={0xB0,0x2D,MIDI_LSB}},
				{name='Play', label='Play/Rec', objectType='Button', midiType='Toggle', midi={0xB0,0x2D,MIDI_LSB}},
			
			}
		}
end
