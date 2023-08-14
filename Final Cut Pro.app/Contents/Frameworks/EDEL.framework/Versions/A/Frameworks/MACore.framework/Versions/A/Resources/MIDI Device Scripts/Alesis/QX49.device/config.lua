-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'QX49',
		-- manufacturer name for this device
		manufacturer = 'Alesis',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
--		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x4A,0x0B,0x6E,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='QX49', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
								
				{name='Loop', label='LOOP', objectType='Button', midiType='Momentary', midi={0xB0,0x77,MIDI_LSB}},
				{name='Rewind', label='<<', objectType='Button', midiType='Momentary', midi={0xB0,0x76,MIDI_LSB}},
				{name='Forward', label='>>', objectType='Button', midiType='Momentary', midi={0xB0,0x75,MIDI_LSB}},
				{name='Stop', label='STOP', objectType='Button', midiType='Momentary', midi={0xB0,0x72,MIDI_LSB}},
				{name='Play', label='PLAY', objectType='Button', midiType='Momentary', midi={0xB0,0x73,MIDI_LSB}},
				{name='Record', label='REC', objectType='Button', midiType='Momentary', midi={0xB0,0x74,MIDI_LSB}},

				{name='Knob 8', label='Volume', objectType='Knob', midi={0xB0,0x15,MIDI_LSB}},

				{name='Slider 1', label='S1', objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},
				{name='Slider 2', label='S2', objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},
				{name='Slider 3', label='S3', objectType='Knob', midi={0xB0,0x18,MIDI_LSB}},
				{name='Slider 4', label='S4', objectType='Knob', midi={0xB0,0x19,MIDI_LSB}},
				{name='Slider 5', label='S5', objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Slider 6', label='S6', objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Slider 7', label='S7', objectType='Knob', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Slider 8', label='S8', objectType='Knob', midi={0xB0,0x1D,MIDI_LSB}},
				
				{name='Knob 1', label='K1', objectType='Knob', midi={0xB0,0x0E,MIDI_LSB}},
				{name='Knob 2', label='K2', objectType='Knob', midi={0xB0,0x0F,MIDI_LSB}},
				{name='Knob 3', label='K3', objectType='Knob', midi={0xB0,0x10,MIDI_LSB}},
				{name='Knob 4', label='K4', objectType='Knob', midi={0xB0,0x11,MIDI_LSB}},
				{name='Knob 5', label='K5', objectType='Knob', midi={0xB0,0x12,MIDI_LSB}},
				{name='Knob 6', label='K6', objectType='Knob', midi={0xB0,0x13,MIDI_LSB}},
				{name='Knob 7', label='K7', objectType='Knob', midi={0xB0,0x14,MIDI_LSB}},
			}
		}
end
