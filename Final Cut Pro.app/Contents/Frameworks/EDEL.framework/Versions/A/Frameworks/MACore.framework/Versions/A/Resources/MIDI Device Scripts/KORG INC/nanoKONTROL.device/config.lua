-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'nanoKONTROL',
		-- manufacturer name for this device
		manufacturer = 'Korg',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Scene 1',

        -- The KORG nanoKONTROL does not support controlling the LEDs, only the nanoKONTROL 2 does.
        supports_feedback = false,

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x42,0x04,0x01,0x00,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Rewind', label='Rewind', objectType='Button', midiType='Momentary', midi={0xB0,0x2F,MIDI_LSB}},
				{name='Play', label='Play', objectType='Button', midiType='Momentary', midi={0xB0,0x2D,MIDI_LSB}},
				{name='Forward', label='Forward', objectType='Button', midiType='Momentary', midi={0xB0,0x30,MIDI_LSB}},
				{name='Cycle', label='Cycle', objectType='Button', midiType='Momentary', midi={0xB0,0x31,MIDI_LSB}},
				{name='Stop', label='Stop', objectType='Button', midiType='Momentary', midi={0xB0,0x2E,MIDI_LSB}},
				{name='Record', label='Record', objectType='Button', midiType='Momentary', midi={0xB0,0x2C,MIDI_LSB}},

				{name='Fader 9', label='Volume', objectType='VFader',midi={0xB0,0x0D,MIDI_LSB}},

				{name='Knob 1', label='Knob 1', objectType='Knob',midi={0xB0,0x0E,MIDI_LSB}},
				{name='Knob 2', label='Knob 2', objectType='Knob',midi={0xB0,0x0F,MIDI_LSB}},
				{name='Knob 3', label='Knob 3', objectType='Knob',midi={0xB0,0x10,MIDI_LSB}},
				{name='Knob 4', label='Knob 4', objectType='Knob',midi={0xB0,0x11,MIDI_LSB}},
				{name='Knob 5', label='Knob 5', objectType='Knob',midi={0xB0,0x12,MIDI_LSB}},
				{name='Knob 6', label='Knob 6', objectType='Knob',midi={0xB0,0x13,MIDI_LSB}},
				{name='Knob 7', label='Knob 7', objectType='Knob',midi={0xB0,0x14,MIDI_LSB}},
				{name='Knob 8', label='Knob 8', objectType='Knob',midi={0xB0,0x15,MIDI_LSB}},
				{name='Knob 9', label='Knob 9', objectType='Knob',midi={0xB0,0x16,MIDI_LSB}},

				{name='Fader 1', label='Fader 1', objectType='VFader',midi={0xB0,0x02,MIDI_LSB}},
				{name='Fader 2', label='Fader 2', objectType='VFader',midi={0xB0,0x03,MIDI_LSB}},
				{name='Fader 3', label='Fader 3', objectType='VFader',midi={0xB0,0x04,MIDI_LSB}},
				{name='Fader 4', label='Fader 4', objectType='VFader',midi={0xB0,0x05,MIDI_LSB}},
				{name='Fader 5', label='Fader 5', objectType='VFader',midi={0xB0,0x06,MIDI_LSB}},
				{name='Fader 6', label='Fader 6', objectType='VFader',midi={0xB0,0x08,MIDI_LSB}},
				{name='Fader 7', label='Fader 7', objectType='VFader',midi={0xB0,0x09,MIDI_LSB}},
				{name='Fader 8', label='Fader 8', objectType='VFader',midi={0xB0,0x0C,MIDI_LSB}},

				{name='Mute 1', label='Mute 1', objectType='Button', midiType='Momentary', midi={0xB0,0x17,MIDI_LSB}},
				{name='Mute 2', label='Mute 2', objectType='Button', midiType='Momentary', midi={0xB0,0x18,MIDI_LSB}},
				{name='Mute 3', label='Mute 3', objectType='Button', midiType='Momentary', midi={0xB0,0x19,MIDI_LSB}},
				{name='Mute 4', label='Mute 4', objectType='Button', midiType='Momentary', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Mute 5', label='Mute 5', objectType='Button', midiType='Momentary', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Mute 6', label='Mute 6', objectType='Button', midiType='Momentary', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Mute 7', label='Mute 7', objectType='Button', midiType='Momentary', midi={0xB0,0x1D,MIDI_LSB}},
				{name='Mute 8', label='Mute 8', objectType='Button', midiType='Momentary', midi={0xB0,0x1E,MIDI_LSB}},
				{name='Mute 9', label='Mute 9', objectType='Button', midiType='Momentary', midi={0xB0,0x1F,MIDI_LSB}},

				{name='Solo 1', label='Solo 1', objectType='Button', midiType='Momentary', midi={0xB0,0x21,MIDI_LSB}},
				{name='Solo 2', label='Solo 2', objectType='Button', midiType='Momentary', midi={0xB0,0x22,MIDI_LSB}},
				{name='Solo 3', label='Solo 3', objectType='Button', midiType='Momentary', midi={0xB0,0x23,MIDI_LSB}},
				{name='Solo 4', label='Solo 4', objectType='Button', midiType='Momentary', midi={0xB0,0x24,MIDI_LSB}},
				{name='Solo 5', label='Solo 5', objectType='Button', midiType='Momentary', midi={0xB0,0x25,MIDI_LSB}},
				{name='Solo 6', label='Solo 6', objectType='Button', midiType='Momentary', midi={0xB0,0x26,MIDI_LSB}},
				{name='Solo 7', label='Solo 7', objectType='Button', midiType='Momentary', midi={0xB0,0x27,MIDI_LSB}},
				{name='Solo 8', label='Solo 8', objectType='Button', midiType='Momentary', midi={0xB0,0x28,MIDI_LSB}},
				{name='Solo 9', label='Solo 9', objectType='Button', midiType='Momentary', midi={0xB0,0x29,MIDI_LSB}},
			}
		}
end