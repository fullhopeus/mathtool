-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'MidAir37',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x63,0x0E,0x15,0x02,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='MidAir37', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=37, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Volume', label='Data Entry', objectType='Volume', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1', label='1', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 2', label='2', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}},
				{name='Knob 3', label='3', objectType='Knob', midi={0xB0,0x0C,MIDI_LSB}},
				{name='Knob 4', label='4', objectType='Knob', midi={0xB0,0x0D,MIDI_LSB}},
				{name='Knob 5', label='5', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 6', label='6', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Knob 7', label='7', objectType='Knob', midi={0xB0,0x5C,MIDI_LSB}},
				{name='Knob 8', label='8', objectType='Knob', midi={0xB0,0x5F,MIDI_LSB}},

				{name='Fader 1', label='9', objectType='VFader', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Fader 2', label='10', objectType='VFader', midi={0xB0,0x47,MIDI_LSB}},
				{name='Fader 3', label='11', objectType='VFader', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Fader 4', label='12', objectType='VFader', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Fader 5', label='13', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 6', label='14', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 7', label='15', objectType='VFader', midi={0xB0,0x05,MIDI_LSB}},
				{name='Fader 8', label='16', objectType='VFader', midi={0xB0,0x54,MIDI_LSB}},
				{name='Fader 9', label='17', objectType='VFader', midi={0xB0,0x0B,MIDI_LSB}},
			}
		}
end
