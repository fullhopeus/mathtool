-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'PhotonX25',
		-- manufacturer name for this device
		manufacturer = 'Alesis',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='PhotonX25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x07,MIDI_LSB}},
                                                                 
				{name='Knob 1',  objectType='Knob', midi={0xB0,0x6C,MIDI_LSB}},
				{name='Knob 2',  objectType='Knob', midi={0xB1,0x6C,MIDI_LSB}},
				{name='Knob 3',  objectType='Knob', midi={0xB2,0x68,MIDI_LSB}},
				{name='Knob 4',  objectType='Knob', midi={0xB3,0x6C,MIDI_LSB}},
				{name='Knob 5',  objectType='Knob', midi={0xB4,0x6C,MIDI_LSB}},
				{name='Knob 6',  objectType='Knob', midi={0xB0,0x6B,MIDI_LSB}},
				{name='Knob 7',  objectType='Knob', midi={0xB1,0x6B,MIDI_LSB}},
				{name='Knob 8',  objectType='Knob', midi={0xB2,0x6B,MIDI_LSB}},
				{name='Knob 9',  objectType='Knob', midi={0xB3,0x6B,MIDI_LSB}},
				{name='Knob 10', objectType='Knob', midi={0xB4,0x6B,MIDI_LSB}},

				{name='AXYZ X',  objectType='VFader', midi={0xB0,0x02,MIDI_LSB}},
				{name='AXYZ Y',  objectType='VFader', midi={0xB0,0x03,MIDI_LSB}},
				{name='AXYZ Z',  objectType='VFader', midi={0xB0,0x04,MIDI_LSB}},

				{name='Button 1',  objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x05,0xF7}},
				{name='Button 2',  objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x04,0xF7}},
				{name='Button 3',  objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x01,0xF7}},
				{name='Button 4',  objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x02,0xF7}},
				{name='Button 5',  objectType='Button', midiType='Momentary', midi={0xB0,0x6A,MIDI_LSB}},
				{name='Button 6',  objectType='Button', midiType='Momentary', midi={0xB0,0x70,MIDI_LSB}},
				{name='Button 7',  objectType='Button', midiType='Momentary', midi={0xB0,0x72,MIDI_LSB}},
				{name='Button 8',  objectType='Button', midiType='Momentary', midi={0xB0,0x74,MIDI_LSB}},
				{name='Button 9',  objectType='Button', midiType='Momentary', midi={0xB0,0x76,MIDI_LSB}},
				{name='Button 10', objectType='Button', midiType='Momentary', midi={0xB0,0x77,MIDI_LSB}},
			}
		}
end
