-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'nanoPAD',
		-- manufacturer name for this device
		manufacturer = 'Korg',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Scene 1',

        -- The KORG nanoPAD does not support controlling the LEDs
        supports_feedback = false,

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x42,0x03,0x01,0x00,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				{name='Keyboard', label='nanoPAD', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=12, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='X', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Volume', objectType='Knob', midi={0xB0,0x01,MIDI_LSB}},

				{name='Pad 1', label='1', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},
				{name='Pad 2', label='2', objectType='Drumpad', midiType='Note', midi={0x90,0x30,MIDI_LSB}},
				{name='Pad 3', label='3', objectType='Drumpad', midiType='Note', midi={0x90,0x2D,MIDI_LSB}},
				{name='Pad 4', label='4', objectType='Drumpad', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},
				{name='Pad 5', label='5', objectType='Drumpad', midiType='Note', midi={0x90,0x33,MIDI_LSB}},
				{name='Pad 6', label='6', objectType='Drumpad', midiType='Note', midi={0x90,0x31,MIDI_LSB}},
				{name='Pad 7', label='7', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				{name='Pad 8', label='8', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				{name='Pad 9', label='9', objectType='Drumpad', midiType='Note', midi={0x90,0x28,MIDI_LSB}},
				{name='Pad 10', label='10', objectType='Drumpad', midiType='Note', midi={0x90,0x2A,MIDI_LSB}},
				{name='Pad 11', label='11', objectType='Drumpad', midiType='Note', midi={0x90,0x2C,MIDI_LSB}},
				{name='Pad 12', label='12', objectType='Drumpad', midiType='Note', midi={0x90,0x2E,MIDI_LSB}},
			}
		}
end
