-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'SAMSON Graphite 25',
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
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='SAMSON Graphite 25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},				
				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},				
				-- Slider
				-- {name='Slider 1', label='S1', objectType='Volume',midi={0xF0,0x7F,0x04,0x01,MIDI_LSB,0xF7}},
				-- Knob Bank 1
				{name='Knob 1', label='E1', objectType='Knob',midi={0xB0,0xA,MIDI_LSB}},
				{name='Knob 2', label='E2', objectType='Knob',midi={0xB1,0xA,MIDI_LSB}},
				{name='Knob 3', label='E3', objectType='Knob',midi={0xB2,0xA,MIDI_LSB}},
				{name='Knob 4', label='E4', objectType='Knob',midi={0xB3,0xA,MIDI_LSB}},
				{name='Knob 5', label='E5', objectType='Knob',midi={0xB0,0x07,MIDI_LSB}},
				{name='Knob 6', label='E6', objectType='Knob',midi={0xB1,0x07,MIDI_LSB}},
				{name='Knob 7', label='E7', objectType='Knob',midi={0xB2,0x07,MIDI_LSB}},
				{name='Knob 8', label='E8', objectType='Knob',midi={0xB3,0x07,MIDI_LSB}},
				-- Knob Bank 2
				{name='Knob 1', label='E1', objectType='Knob',midi={0xB4,0xA,MIDI_LSB}},
				{name='Knob 2', label='E2', objectType='Knob',midi={0xB5,0xA,MIDI_LSB}},
				{name='Knob 3', label='E3', objectType='Knob',midi={0xB6,0xA,MIDI_LSB}},
				{name='Knob 4', label='E4', objectType='Knob',midi={0xB7,0xA,MIDI_LSB}},
				{name='Knob 5', label='E5', objectType='Knob',midi={0xB4,0x07,MIDI_LSB}},
				{name='Knob 6', label='E6', objectType='Knob',midi={0xB5,0x07,MIDI_LSB}},
				{name='Knob 7', label='E7', objectType='Knob',midi={0xB6,0x07,MIDI_LSB}},
				{name='Knob 8', label='E8', objectType='Knob',midi={0xB7,0x07,MIDI_LSB}},
				-- Knob Bank 3
				{name='Knob 1', label='E1', objectType='Knob',midi={0xB8,0xA,MIDI_LSB}},
				{name='Knob 2', label='E2', objectType='Knob',midi={0xB9,0xA,MIDI_LSB}},
				{name='Knob 3', label='E3', objectType='Knob',midi={0xBA,0xA,MIDI_LSB}},
				{name='Knob 4', label='E4', objectType='Knob',midi={0xBB,0xA,MIDI_LSB}},
				{name='Knob 5', label='E5', objectType='Knob',midi={0xB8,0x07,MIDI_LSB}},
				{name='Knob 6', label='E6', objectType='Knob',midi={0xB9,0x07,MIDI_LSB}},
				{name='Knob 7', label='E7', objectType='Knob',midi={0xBA,0x07,MIDI_LSB}},
				{name='Knob 8', label='E8', objectType='Knob',midi={0xBB,0x07,MIDI_LSB}},
				-- Knob Bank 4
				{name='Knob 1', label='E1', objectType='Knob',midi={0xBC,0xA,MIDI_LSB}},
				{name='Knob 2', label='E2', objectType='Knob',midi={0xBD,0xA,MIDI_LSB}},
				{name='Knob 3', label='E3', objectType='Knob',midi={0xBE,0xA,MIDI_LSB}},
				{name='Knob 4', label='E4', objectType='Knob',midi={0xBF,0xA,MIDI_LSB}},
				{name='Knob 5', label='E5', objectType='Knob',midi={0xBC,0x07,MIDI_LSB}},
				{name='Knob 6', label='E6', objectType='Knob',midi={0xBD,0x07,MIDI_LSB}},
				{name='Knob 7', label='E7', objectType='Knob',midi={0xBE,0x07,MIDI_LSB}},
				{name='Knob 8', label='E8', objectType='Knob',midi={0xBF,0x07,MIDI_LSB}},

				-- Bank 1
 				{name='Button 1', label='F1', objectType='Button', midiType='Alternating', midi={0xB0,0x10,MIDI_LSB}},
				{name='Button 2', label='F2', objectType='Button', midiType='Alternating', midi={0xB1,0x11,MIDI_LSB}},
				{name='Button 3', label='F3', objectType='Button', midiType='Alternating', midi={0xB2,0x12,MIDI_LSB}},
				{name='Button 4', label='F4', objectType='Button', midiType='Alternating', midi={0xB3,0x13,MIDI_LSB}},
				-- Bank 2
 				{name='Button 1', label='F1', objectType='Button', midiType='Alternating', midi={0xB4,0x14,MIDI_LSB}},
				{name='Button 2', label='F2', objectType='Button', midiType='Alternating', midi={0xB5,0x15,MIDI_LSB}},
				{name='Button 3', label='F3', objectType='Button', midiType='Alternating', midi={0xB6,0x16,MIDI_LSB}},
				{name='Button 4', label='F4', objectType='Button', midiType='Alternating', midi={0xB7,0x17,MIDI_LSB}},
				-- Bank 3
 				{name='Button 1', label='F1', objectType='Button', midiType='Alternating', midi={0xB8,0x18,MIDI_LSB}},
				{name='Button 2', label='F2', objectType='Button', midiType='Alternating', midi={0xB9,0x19,MIDI_LSB}},
				{name='Button 3', label='F3', objectType='Button', midiType='Alternating', midi={0xBA,0x1A,MIDI_LSB}},
				{name='Button 4', label='F4', objectType='Button', midiType='Alternating', midi={0xBB,0x1B,MIDI_LSB}},
				-- Bank 4
 				{name='Button 1', label='F1', objectType='Button', midiType='Alternating', midi={0xBC,0x1C,MIDI_LSB}},
				{name='Button 2', label='F2', objectType='Button', midiType='Alternating', midi={0xBD,0x1D,MIDI_LSB}},
				{name='Button 3', label='F3', objectType='Button', midiType='Alternating', midi={0xBE,0x1E,MIDI_LSB}},
				{name='Button 4', label='F4', objectType='Button', midiType='Alternating', midi={0xBF,0x1F,MIDI_LSB}},

				-- Drum Pad Bank A
				{name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0xB9,40,MIDI_LSB}},
				{name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0xB9,41,MIDI_LSB}},
				{name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0xB9,42,MIDI_LSB}},
				{name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0xB9,43,MIDI_LSB}},
				-- Drum Pad Bank B
				{name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0xB9,36,MIDI_LSB}},
				{name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0xB9,37,MIDI_LSB}},
				{name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0xB9,38,MIDI_LSB}},
				{name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0xB9,39,MIDI_LSB}},								
				-- Transport
				{name='Rewind',  label='◀◀', objectType='Button', midiType='Single', midi={0xBF,0x74,MIDI_LSB}},
				{name='Forward', label='▶▶', objectType='Button', midiType='Single', midi={0xBF,0x75,MIDI_LSB}},
				{name='Stop', 	 label='■',  objectType='Button', midiType='Single', midi={0xBF,0x76,MIDI_LSB}},
				{name='Play', 	 label='▶',  objectType='Button', midiType='Single', midi={0xBF,0x77,MIDI_LSB}},
				{name='Record',  label='●',  objectType='Button', midiType='Single', midi={0xBF,0x72,MIDI_LSB}},			
			}
		}
end
