-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Launchkey Mini',
		-- manufacturer name for this device
		manufacturer = 'Focusrite A.E. Ltd',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
			-- Keyboard
			{name='Keyboard', label='Launchkey Mini', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
			-- Track Buttons
			{name='Track Left Arrow', label='◀', objectType='Button', midiType='Momentary', midi={0xB0,0x6A,MIDI_LSB}},
			{name='Track Right Arrow', label='▶', objectType='Button', midiType='Momentary', midi={0xB0,0x6B,MIDI_LSB}},
			-- Scene Buttons
			{name='Scene Up Arrow', label='◀', objectType='Button', midiType='Momentary', midi={0xB0,0x68,MIDI_LSB}},
			{name='Scene Down Arrow', label='▶', objectType='Button', midiType='Momentary', midi={0xB0,0x69,MIDI_LSB}},
			-- Volume Knob Always Last Knob
			{name='Knob 8', label='Volume', objectType='Knob', midi={0xB0,0x1C,MIDI_LSB}},
			-- Knobs
			{name='Knob 1', label='K1', objectType='Knob', midi={0xB0,0x15,MIDI_LSB}},
			{name='Knob 2', label='K2', objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},
			{name='Knob 3', label='K3', objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},
			{name='Knob 4', label='K4', objectType='Knob', midi={0xB0,0x18,MIDI_LSB}},
			{name='Knob 5', label='K5', objectType='Knob', midi={0xB0,0x19,MIDI_LSB}},
			{name='Knob 6', label='K6', objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
			{name='Knob 7', label='K7', objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
			-- Row 1-8
			-- {name='Pad 1', label='PAD 1', objectType='Drumpad', midiType='Note', midi={0x99,0x28,MIDI_LSB}},
			-- {name='Pad 2', label='PAD 2', objectType='Drumpad', midiType='Note', midi={0x99,0x29,MIDI_LSB}},
			-- {name='Pad 3', label='PAD 3', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}},
			-- {name='Pad 4', label='PAD 4', objectType='Drumpad', midiType='Note', midi={0x99,0x2B,MIDI_LSB}},

			-- {name='Pad 5', label='PAD 5', objectType='Drumpad', midiType='Note', midi={0x99,0x30,MIDI_LSB}},
			-- {name='Pad 6', label='PAD 6', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}},
			-- {name='Pad 7', label='PAD 7', objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}},
			-- {name='Pad 8', label='PAD 8', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}},
			-- -- Row 9-10
			-- {name='Pad 9',  label='PAD 9',  objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}},
			-- {name='Pad 10', label='PAD 10', objectType='Drumpad', midiType='Note', midi={0x99,0x25,MIDI_LSB}},
			-- {name='Pad 11', label='PAD 11', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}},
			-- {name='Pad 12', label='PAD 12', objectType='Drumpad', midiType='Note', midi={0x99,0x27,MIDI_LSB}},
			
			-- {name='Pad 13', label='PAD 13', objectType='Drumpad', midiType='Note', midi={0x99,0x2C,MIDI_LSB}},
			-- {name='Pad 14', label='PAD 14', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}},
			-- {name='Pad 15', label='PAD 15', objectType='Drumpad', midiType='Note', midi={0x99,0x3E,MIDI_LSB}},
			-- {name='Pad 16', label='PAD 16', objectType='Drumpad', midiType='Note', midi={0x99,0x3F,MIDI_LSB}},
			-- -- Launch Row Button
			-- {name='Row 1 Launch', label='▶', objectType='Button', midiType='Momentary', midi={0xB0,0x6C,MIDI_LSB}},
			-- {name='Row 2 Launch', label='▶', objectType='Button', midiType='Momentary', midi={0xB0,0x6D,MIDI_LSB}}
		}
	}
end