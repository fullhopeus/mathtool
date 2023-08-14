-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'padKONTROL',
		-- manufacturer name for this device
		manufacturer = 'Korg',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x42,0x6E,0x00,0x08,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				{name='Keyboard', label='padKONTROL', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=16, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pad X', objectType='Wheel', midi={0xE9,MIDI_MSB,MIDI_LSB}, inport="PORT A"},
				{name='Modulation', label='Pad Y', objectType='Wheel', midi={0xB9,0x01,MIDI_LSB}, inport="PORT A"},

				{name='Knob 2', objectType='Knob', midi={0xB9,0x15,MIDI_LSB}, inport="PORT A"},
				{name='Knob 1', objectType='Knob', midi={0xB9,0x14,MIDI_LSB}, inport="PORT A"},

				{name='Pedal', label='Pedal', objectType='Pedal', midiType='Note', midi={0x99,0x2F,MIDI_LSB}, inport="PORT A"},

				{name='Pad 1',  label='01', objectType='Drumpad', midiType='Note', midi={0x99,0x3D,MIDI_LSB}, inport="PORT A"},
				{name='Pad 2',  label='02', objectType='Drumpad', midiType='Note', midi={0x99,0x45,MIDI_LSB}, inport="PORT A"},
				{name='Pad 3',  label='03', objectType='Drumpad', midiType='Note', midi={0x99,0x41,MIDI_LSB}, inport="PORT A"},
				{name='Pad 4',  label='04', objectType='Drumpad', midiType='Note', midi={0x99,0x3F,MIDI_LSB}, inport="PORT A"},
				{name='Pad 5',  label='05', objectType='Drumpad', midiType='Note', midi={0x99,0x3C,MIDI_LSB}, inport="PORT A"},
				{name='Pad 6',  label='06', objectType='Drumpad', midiType='Note', midi={0x99,0x3B,MIDI_LSB}, inport="PORT A"},
				{name='Pad 7',  label='07', objectType='Drumpad', midiType='Note', midi={0x99,0x39,MIDI_LSB}, inport="PORT A"},
				{name='Pad 8',  label='08', objectType='Drumpad', midiType='Note', midi={0x99,0x37,MIDI_LSB}, inport="PORT A"},
				{name='Pad 9',  label='09', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}, inport="PORT A"},
				{name='Pad 10', label='10', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}, inport="PORT A"},
				{name='Pad 11', label='11', objectType='Drumpad', midiType='Note', midi={0x99,0x44,MIDI_LSB}, inport="PORT A"},
				{name='Pad 12', label='12', objectType='Drumpad', midiType='Note', midi={0x99,0x38,MIDI_LSB}, inport="PORT A"},
				{name='Pad 13', label='13', objectType='Drumpad', midiType='Note', midi={0x99,0x30,MIDI_LSB}, inport="PORT A"},
				{name='Pad 14', label='14', objectType='Drumpad', midiType='Note', midi={0x99,0x34,MIDI_LSB}, inport="PORT A"},
				{name='Pad 15', label='15', objectType='Drumpad', midiType='Note', midi={0x99,0x36,MIDI_LSB}, inport="PORT A"},
				{name='Pad 16', label='16', objectType='Drumpad', midiType='Note', midi={0x99,0x3A,MIDI_LSB}, inport="PORT A"},
			}
		}
end
