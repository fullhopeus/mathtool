-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Axiom 25',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x63,0x0E,0x19,0x03,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='A18', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='A19', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Axiom 25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Knob 8', label='Volume', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},

				{name='Knob 1', label='B5', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 2', label='B6', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 3', label='B7', objectType='Knob', midi={0xB0,0x54,MIDI_LSB}},
				{name='Knob 4', label='B8', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},
				{name='Knob 5', label='B1', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 6', label='B2', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 7', label='B3', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},

				{name='LOOP', label='B31', objectType='Button', midiType='Single', midi={0xB0,0x14,MIDI_LSB}},
				{name='REWIND', label='B32', objectType='Button', midiType='Single', midi={0xB0,0x15,MIDI_LSB}},
				{name='FORWARD', label='B33', objectType='Button', midiType='Single', midi={0xB0,0x16,MIDI_LSB}},
				{name='STOP', label='B34', objectType='Button', midiType='Single', midi={0xB0,0x17,MIDI_LSB}},
				{name='PLAY', label='B35', objectType='Button', midiType='Single', midi={0xB0,0x18,MIDI_LSB}},
				{name='RECORD', label='B36', objectType='Button', midiType='Single', midi={0xB0,0x19,MIDI_LSB}},

				{name='Pad 1', label='C27', objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}},
				{name='Pad 2', label='C28', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}},
				{name='Pad 3', label='C29', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}},
				{name='Pad 4', label='C30', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}},
				{name='Pad 5', label='C23', objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}},
				{name='Pad 6', label='C24', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}},
				{name='Pad 7', label='C25', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}},
				{name='Pad 8', label='C26', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}},
			}
		}
end
