-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'MK-449C',
		-- manufacturer name for this device
		manufacturer = 'Evolution Electronics Ltd.',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 0',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x4D,0x14,0x0F,0x01,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='C18', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='C19', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='MK-449C', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Fader 9', label='Volume', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},

				{name='Fader 1', label='F1', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 2', label='F2', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 3', label='F3', objectType='VFader', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Fader 4', label='F4', objectType='VFader', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Fader 5', label='F5', objectType='VFader', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Fader 6', label='F6', objectType='VFader', midi={0xB0,0x47,MIDI_LSB}},
				{name='Fader 7', label='F7', objectType='VFader', midi={0xB0,0x05,MIDI_LSB}},
				{name='Fader 8', label='F8', objectType='VFader', midi={0xB0,0x54,MIDI_LSB}},

				{name='Knob 1', label='C10', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 2', label='C11', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}},
				{name='Knob 3', label='C12', objectType='Knob', midi={0xB0,0x0C,MIDI_LSB}},
				{name='Knob 4', label='C13', objectType='Knob', midi={0xB0,0x0D,MIDI_LSB}},
				{name='Knob 5', label='C14', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 6', label='C15', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Knob 7', label='C16', objectType='Knob', midi={0xB0,0x5C,MIDI_LSB}},
				{name='Knob 8', label='C17', objectType='Knob', midi={0xB0,0x5F,MIDI_LSB}},
			}
		}
end
