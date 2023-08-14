-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Analog Experience - The Player',
		-- manufacturer name for this device
		manufacturer = 'Arturia',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='The Player', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Volume', label='Level', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1', label='Cutoff', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 2', label='Reso', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 3', label='Chorus', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 4', label='Delay', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				
				{name='Knob 5', label='A', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 6', label='D', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 7', label='S', objectType='Knob', midi={0xB0,0x4F,MIDI_LSB}},
				{name='Knob 8', label='R', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},

				{name='Button 1', label='1', objectType='Button', midiType='Momentary', midi={0xB0,0x16,MIDI_LSB}},
				{name='Button 2', label='2', objectType='Button', midiType='Momentary', midi={0xB0,0x17,MIDI_LSB}},
				{name='Button 3', label='3', objectType='Button', midiType='Momentary', midi={0xB0,0x18,MIDI_LSB}},
				{name='Button 4', label='4', objectType='Button', midiType='Momentary', midi={0xB0,0x19,MIDI_LSB}},
				
				{name='Button 5', label='Shift 1', objectType='Button', midiType='Momentary', midi={0xB0,0x68,MIDI_LSB}},
				{name='Button 6', label='Shift 2', objectType='Button', midiType='Momentary', midi={0xB0,0x69,MIDI_LSB}},
				{name='Button 7', label='Shift 3', objectType='Button', midiType='Momentary', midi={0xB0,0x6A,MIDI_LSB}},
				{name='Button 8', label='Shift 4', objectType='Button', midiType='Momentary', midi={0xB0,0x6B,MIDI_LSB}},
			}
		}
end
