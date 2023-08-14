-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'MK-249C',
		-- manufacturer name for this device
		manufacturer = 'Evolution Electronics Ltd.',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 0',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='C18', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='C19', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='MK-449C', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Master Volume', label='Volume', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1',  label='1 Pan',        objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 2',  label='2 Expression', objectType='Knob', midi={0xB0,0x0B,MIDI_LSB}},
				{name='Knob 3',  label='3 Effect 1',   objectType='Knob', midi={0xB0,0x0C,MIDI_LSB}},
				{name='Knob 4',  label='4 Effect 2',   objectType='Knob', midi={0xB0,0x0D,MIDI_LSB}},
				{name='Knob 5',  label='5 Reverb',     objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 6',  label='6 Chorus',     objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 7',  label='7 Delay',      objectType='Knob', midi={0xB0,0x5E,MIDI_LSB}},
				{name='Knob 8',  label='8 Phaser',     objectType='Knob', midi={0xB0,0x5F,MIDI_LSB}},
				{name='Knob 9',  label='9 Attack',     objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 10', label='10 Release',   objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 11', label='11 Cut off',   objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 12', label='12 Resonance', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
			}
		}
end
