-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'UMA25S',
		-- manufacturer name for this device
		manufacturer = 'Behringer',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='E17', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='E18', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='UMA25S', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expression', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Volume', label='E19', objectType='Volume', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1', label='E9',  objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 2', label='E10', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 3', label='E11', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 4', label='E12', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 5', label='E13', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 6', label='E14', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 7', label='E15', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 8', label='E16', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},

				{name='Button 1', label='E1', objectType='Button', midiType='Alternating', midi={0xB0,0x15,MIDI_LSB}},
				{name='Button 2', label='E2', objectType='Button', midiType='Alternating', midi={0xB0,0x16,MIDI_LSB}},
				{name='Button 3', label='E3', objectType='Button', midiType='Alternating', midi={0xB0,0x17,MIDI_LSB}},
				{name='Button 4', label='E4', objectType='Button', midiType='Alternating', midi={0xB0,0x18,MIDI_LSB}},
				{name='Button 5', label='E5', objectType='Button', midiType='Alternating', midi={0xB0,0x19,MIDI_LSB}},
				{name='Button 6', label='E6', objectType='Button', midiType='Alternating', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Button 7', label='E7', objectType='Button', midiType='Alternating', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Button 8', label='E8', objectType='Button', midiType='Alternating', midi={0xB0,0x1C,MIDI_LSB}},
			}
		}
end
