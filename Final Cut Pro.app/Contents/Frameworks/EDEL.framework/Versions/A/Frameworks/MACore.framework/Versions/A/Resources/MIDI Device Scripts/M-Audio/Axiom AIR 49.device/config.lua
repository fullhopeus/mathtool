-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Axiom AIR 49',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		-- device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x63,0x0E,0x19,0x03,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Axiom AIR 49', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Fader 9', label='Volume', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},
				
				{name='Knob 1', label='B5', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 2', label='B6', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Knob 3', label='B7', objectType='Knob', midi={0xB0,0x5C,MIDI_LSB}},
				{name='Knob 4', label='B8', objectType='Knob', midi={0xB0,0x5F,MIDI_LSB}},
				{name='Knob 5', label='B1', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 6', label='B2', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}},
				{name='Knob 7', label='B3', objectType='Knob', midi={0xB0,0x4E,MIDI_LSB}},
				{name='Knob 8', label='B4', objectType='Knob', midi={0xB0,0x4F,MIDI_LSB}},

				{name='LOOP', label='B31', objectType='Button', midiType='Momentary', midi={0xB0,0x71,MIDI_LSB}},
				{name='REWIND', label='B32', objectType='Button', midiType='Momentary', midi={0xB0,0x72,MIDI_LSB}},
				{name='FORWARD', label='B33', objectType='Button', midiType='Momentary', midi={0xB0,0x73,MIDI_LSB}},
				{name='STOP', label='B34', objectType='Button', midiType='Momentary', midi={0xB0,0x74,MIDI_LSB}},
				{name='PLAY', label='B35', objectType='Button', midiType='Momentary', midi={0xB0,0x75,MIDI_LSB}},
				{name='RECORD', label='B36', objectType='Button', midiType='Momentary', midi={0xB0,0x76,MIDI_LSB}},	

				{name='Fader 1', label='1', objectType='VFader', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Fader 2', label='2', objectType='VFader', midi={0xB0,0x47,MIDI_LSB}},
				{name='Fader 3', label='3', objectType='VFader', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Fader 4', label='4', objectType='VFader', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Fader 5', label='5', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 6', label='6', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 7', label='7', objectType='VFader', midi={0xB0,0x05,MIDI_LSB}},
				{name='Fader 8', label='8', objectType='VFader', midi={0xB0,0x54,MIDI_LSB}},

				{name='Button 1', label='1', objectType='Button', midiType='Alternating', midi={0xB0,0x55,MIDI_LSB}, outport='Port A'},
				{name='Button 2', label='2', objectType='Button', midiType='Alternating', midi={0xB0,0x56,MIDI_LSB}, outport='Port A'},
				{name='Button 3', label='3', objectType='Button', midiType='Alternating', midi={0xB0,0x57,MIDI_LSB}, outport='Port A'},
				{name='Button 4', label='4', objectType='Button', midiType='Alternating', midi={0xB0,0x58,MIDI_LSB}, outport='Port A'},
				{name='Button 5', label='5', objectType='Button', midiType='Alternating', midi={0xB0,0x59,MIDI_LSB}, outport='Port A'},
				{name='Button 6', label='6', objectType='Button', midiType='Alternating', midi={0xB0,0x5A,MIDI_LSB}, outport='Port A'},
				{name='Button 7', label='7', objectType='Button', midiType='Alternating', midi={0xB0,0x6E,MIDI_LSB}, outport='Port A'},
				{name='Button 8', label='8', objectType='Button', midiType='Alternating', midi={0xB0,0x6F,MIDI_LSB}, outport='Port A'},
				{name='Button 9', label='9', objectType='Button', midiType='Alternating', midi={0xB0,0x70,MIDI_LSB}, outport='Port A'},			
				
				{name='Pad 1', label='9', objectType='Drumpad', midiType='Note', midi={0x90,0x2C,MIDI_LSB}},
				{name='Pad 2', label='10', objectType='Drumpad', midiType='Note', midi={0x90,0x2D,MIDI_LSB}},
				{name='Pad 3', label='11', objectType='Drumpad', midiType='Note', midi={0x90,0x2E,MIDI_LSB}},
				{name='Pad 4', label='12', objectType='Drumpad', midiType='Note', midi={0x90,0x2F,MIDI_LSB}},
				{name='Pad 5', label='5', objectType='Drumpad', midiType='Note', midi={0x90,0x28,MIDI_LSB}},
				{name='Pad 6', label='6', objectType='Drumpad', midiType='Note', midi={0x90,0x29,MIDI_LSB}},
				{name='Pad 7', label='7', objectType='Drumpad', midiType='Note', midi={0x90,0x2A,MIDI_LSB}},
				{name='Pad 8', label='8', objectType='Drumpad', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},
				{name='Pad 9', label='1', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				{name='Pad 10', label='2', objectType='Drumpad', midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				{name='Pad 11', label='3', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				{name='Pad 12', label='4', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},

			}
		}
end
