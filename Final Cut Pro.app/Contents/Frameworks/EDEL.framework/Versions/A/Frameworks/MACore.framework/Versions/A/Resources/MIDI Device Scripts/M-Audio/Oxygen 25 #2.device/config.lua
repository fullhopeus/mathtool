-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Oxygen 25',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',

		preset_name = 'Preset 1 - Channel 1 - Program 00',


		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='C16', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='C17', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Oxygen 25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='C18', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Volume', label='Volume', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1', label='C1', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 2', label='C2', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 3', label='C3', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 4', label='C4', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 5', label='C5', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 6', label='C6', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 7', label='C7', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 8', label='C8', objectType='Knob', midi={0xB0,0x54,MIDI_LSB}},
                                
				{name='TRACK-', objectType='Button', midiType='Momentary', midi={0xBF,0x6E,MIDI_LSB}},
				{name='TRACK+', objectType='Button', midiType='Momentary', midi={0xBF,0x6F,MIDI_LSB}},

				{name='LOOP', label='C10', objectType='Button', midiType='Momentary', midi={0xBF,0x71,MIDI_LSB}},
				{name='REWIND', label='C11', objectType='Button', midiType='Momentary', midi={0xBF,0x72,MIDI_LSB}},
				{name='FORWARD', label='C12', objectType='Button', midiType='Momentary', midi={0xBF,0x73,MIDI_LSB}},
				{name='STOP', label='C13', objectType='Button', midiType='Momentary', midi={0xBF,0x74,MIDI_LSB}},
				{name='PLAY', label='C14', objectType='Button', midiType='Momentary', midi={0xBF,0x75,MIDI_LSB}},
				{name='RECORD', label='C15', objectType='Button', midiType='Momentary', midi={0xBF,0x76,MIDI_LSB}},
			}
		}
end
