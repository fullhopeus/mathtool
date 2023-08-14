-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'MPK mini',
		-- manufacturer name for this device
		manufacturer = 'AKAI PROFESSIONAL,LP',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Keyboard', label='MPK mini', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				-- Volume Knob Always Last Knob
				{name='Knob 8', label='Volume', objectType='Knob', midi={0xB0,0x08,MIDI_LSB}},

				{name='Knob 1', label='K1', objectType='Knob', midi={0xB0,0x01,MIDI_LSB}},
				{name='Knob 2', label='K2', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}},
				{name='Knob 3', label='K3', objectType='Knob', midi={0xB0,0x03,MIDI_LSB}},
				{name='Knob 4', label='K4', objectType='Knob', midi={0xB0,0x04,MIDI_LSB}},
				{name='Knob 5', label='K5', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 6', label='K6', objectType='Knob', midi={0xB0,0x06,MIDI_LSB}},
				{name='Knob 7', label='K7', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},
				-- PAD Bank 1
				{name='Pad 1', label='PAD 1', objectType='Drumpad', midiType='Note', midi={0x90,0x30,MIDI_LSB}},
				{name='Pad 2', label='PAD 2', objectType='Drumpad', midiType='Note', midi={0x90,0x31,MIDI_LSB}},
				{name='Pad 3', label='PAD 3', objectType='Drumpad', midiType='Note', midi={0x90,0x32,MIDI_LSB}},
				{name='Pad 4', label='PAD 4', objectType='Drumpad', midiType='Note', midi={0x90,0x33,MIDI_LSB}},
				{name='Pad 5', label='PAD 5', objectType='Drumpad', midiType='Note', midi={0x90,0x2C,MIDI_LSB}},
				{name='Pad 6', label='PAD 6', objectType='Drumpad', midiType='Note', midi={0x90,0x2D,MIDI_LSB}},
				{name='Pad 7', label='PAD 7', objectType='Drumpad', midiType='Note', midi={0x90,0x2E,MIDI_LSB}},
				{name='Pad 8', label='PAD 8', objectType='Drumpad', midiType='Note', midi={0x90,0x2F,MIDI_LSB}},
				-- PAD Bank 2
				{name='Pad 9', label='PAD 9', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				{name='Pad 10', label='PAD 10', objectType='Drumpad', midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				{name='Pad 11', label='PAD 11', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				{name='Pad 12', label='PAD 12', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},
				{name='Pad 13', label='PAD 13', objectType='Drumpad', midiType='Note', midi={0x90,0x20,MIDI_LSB}},
				{name='Pad 14', label='PAD 14', objectType='Drumpad', midiType='Note', midi={0x90,0x21,MIDI_LSB}},
				{name='Pad 15', label='PAD 15', objectType='Drumpad', midiType='Note', midi={0x90,0x22,MIDI_LSB}},
				{name='Pad 16', label='PAD 16', objectType='Drumpad', midiType='Note', midi={0x90,0x23,MIDI_LSB}},

			}
		}
end
