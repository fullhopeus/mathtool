-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Axiom A.I.R. Mini32',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		
		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		-- device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x01,0x05,0x63,0x0E,0x2C,0x50,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Axiom A.I.R. Mini32', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=32, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='LEFT', label='LEFT', objectType='Button', midiType='Momentary', midi={0xB0,0x15,MIDI_LSB}},
				{name='RIGHT', label='RIGHT', objectType='Button', midiType='Momentary', midi={0xB0,0x16,MIDI_LSB}},
				{name='UP', label='UP', objectType='Button', midiType='Momentary', midi={0xB0,0x13,MIDI_LSB}},
				{name='DOWN', label='DOWN', objectType='Button', midiType='Momentary', midi={0xB0,0x14,MIDI_LSB}},

				{name='Knob 8', label='Volume', objectType='Knob', midi={0xB0,0x08,MIDI_LSB}},
				
				{name='Knob 1', label='1', objectType='Knob', midi={0xB0,0x01,MIDI_LSB}},
				{name='Knob 2', label='2', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}},
				{name='Knob 3', label='3', objectType='Knob', midi={0xB0,0x03,MIDI_LSB}},
				{name='Knob 4', label='4', objectType='Knob', midi={0xB0,0x04,MIDI_LSB}},
				{name='Knob 5', label='5', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 6', label='6', objectType='Knob', midi={0xB0,0x06,MIDI_LSB}},
				{name='Knob 7', label='7', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},

				{name='STOP', label='STOP', objectType='Button', midiType='Momentary', midi={0xB0,0x10,MIDI_LSB}},
				{name='PLAY', label='PLAY', objectType='Button', midiType='Momentary', midi={0xB0,0x11,MIDI_LSB}},
				{name='RECORD', label='REC', objectType='Button', midiType='Momentary', midi={0xB0,0x12,MIDI_LSB}},

				{name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0x90,0x28,MIDI_LSB}},
				{name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0x90,0x29,MIDI_LSB}},
				{name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0x90,0x2A,MIDI_LSB}},
				{name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},
				{name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				{name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				{name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				{name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},
				{name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0x90,0x30,MIDI_LSB}},
				{name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0x90,0x31,MIDI_LSB}},
				{name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0x90,0x32,MIDI_LSB}},
				{name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0x90,0x33,MIDI_LSB}},
				{name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0x90,0x2C,MIDI_LSB}},
				{name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0x90,0x2D,MIDI_LSB}},
				{name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0x90,0x2E,MIDI_LSB}},
				{name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0x90,0x2F,MIDI_LSB}},
			}
		}
end
