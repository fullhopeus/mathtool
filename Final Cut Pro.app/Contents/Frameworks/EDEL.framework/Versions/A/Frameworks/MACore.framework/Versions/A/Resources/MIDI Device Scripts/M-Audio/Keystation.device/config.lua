-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Keystation',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- This device does active sense
		active_sense = true,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Keystation', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Volume', label='Data Entry', objectType='Volume', midi={0xB0,0x07,MIDI_LSB}},

				{name='Fader 1', objectType='VFader', midi={0xB0,0x52,MIDI_LSB}},
				{name='Fader 2', objectType='VFader', midi={0xB0,0x53,MIDI_LSB}},
				{name='Fader 3', objectType='VFader', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Fader 4', objectType='VFader', midi={0xB0,0x1D,MIDI_LSB}},
				{name='Fader 5', objectType='VFader', midi={0xB0,0x10,MIDI_LSB}},
				{name='Fader 6', objectType='VFader', midi={0xB0,0x50,MIDI_LSB}},
				{name='Fader 7', objectType='VFader', midi={0xB0,0x12,MIDI_LSB}},
				{name='Fader 8', objectType='VFader', midi={0xB0,0x13,MIDI_LSB}},

				{name='Knob 1', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 2', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 3', objectType='Knob', midi={0xB0,0x51,MIDI_LSB}},
				{name='Knob 4', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 5', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}},
				{name='Knob 6', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 7', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 8', objectType='Knob', midi={0xB0,0x15,MIDI_LSB}},
			}
		}
end
