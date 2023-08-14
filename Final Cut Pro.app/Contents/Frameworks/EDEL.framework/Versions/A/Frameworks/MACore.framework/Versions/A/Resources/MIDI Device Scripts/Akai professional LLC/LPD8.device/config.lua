-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'LPD8',
		-- manufacturer name for this device
		manufacturer = 'Akai',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				{name='Keyboard', label='LPD8', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=8, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='PAD 5', objectType='Drumpad', midiType='Note', midi={0x90,0x28,MIDI_LSB}},
				{name='PAD 6', objectType='Drumpad', midiType='Note', midi={0x90,0x29,MIDI_LSB}},
				{name='PAD 7', objectType='Drumpad', midiType='Note', midi={0x90,0x2A,MIDI_LSB}},
				{name='PAD 8', objectType='Drumpad', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},

				{name='PAD 1', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				{name='PAD 2', objectType='Drumpad', midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				{name='PAD 3', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				{name='PAD 4', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},

				{name='Knob 8', label='Volume', objectType='Knob',midi={0xB0,0x08,MIDI_LSB}},

				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Knob 1', objectType='Knob',midi={0xB0,0x01,MIDI_LSB}},
				{name='Knob 2', objectType='Knob',midi={0xB0,0x02,MIDI_LSB}},
				{name='Knob 3', objectType='Knob',midi={0xB0,0x03,MIDI_LSB}},
				{name='Knob 4', objectType='Knob',midi={0xB0,0x04,MIDI_LSB}},
				{name='Knob 5', objectType='Knob',midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 6', objectType='Knob',midi={0xB0,0x06,MIDI_LSB}},
				{name='Knob 7', objectType='Knob',midi={0xB0,0x07,MIDI_LSB}},
			}
		}
end
