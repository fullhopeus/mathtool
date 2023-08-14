-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Oxygen 49',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',

		-- Sysex response for the new model:
		-- F0 7E 7F 06 02 00 01 05 63 0E 27 40 30 31 30 30 F7

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='C33', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='C34', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Oxygen 49', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='C35', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Fader 9', label='Volume ', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},

				{name='Fader 1', label='C1', objectType='VFader', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Fader 2', label='C2', objectType='VFader', midi={0xB0,0x47,MIDI_LSB}},
				{name='Fader 3', label='C3', objectType='VFader', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Fader 4', label='C4', objectType='VFader', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Fader 5', label='C5', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 6', label='C6', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 7', label='C7', objectType='VFader', midi={0xB0,0x05,MIDI_LSB}},
				{name='Fader 8', label='C8', objectType='VFader', midi={0xB0,0x54,MIDI_LSB}},

				{name='Knob 1', label='C10', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 2', label='C11', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Knob 3', label='C12', objectType='Knob', midi={0xB0,0x5C,MIDI_LSB}},
				{name='Knob 4', label='C13', objectType='Knob', midi={0xB0,0x5F,MIDI_LSB}},
				{name='Knob 5', label='C14', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 6', label='C15', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}},
				{name='Knob 7', label='C16', objectType='Knob', midi={0xB0,0x4E,MIDI_LSB}},
				{name='Knob 8', label='C17', objectType='Knob', midi={0xB0,0x4F,MIDI_LSB}},
                                
				{name='TRACK-', objectType='Button', midiType='Momentary', midi={0xBF,0x6E,MIDI_LSB}},
				{name='TRACK+', objectType='Button', midiType='Momentary', midi={0xBF,0x6F,MIDI_LSB}},

				{name='LOOP', label='C27', objectType='Button', midiType='Momentary', midi={0xBF,0x71,MIDI_LSB}},
				{name='REWIND', label='C28', objectType='Button', midiType='Momentary', midi={0xBF,0x72,MIDI_LSB}},
				{name='FORWARD', label='C29', objectType='Button', midiType='Momentary', midi={0xBF,0x73,MIDI_LSB}},
				{name='STOP', label='C30', objectType='Button', midiType='Momentary', midi={0xBF,0x74,MIDI_LSB}},
				{name='PLAY', label='C31', objectType='Button', midiType='Momentary', midi={0xBF,0x75,MIDI_LSB}},
				{name='RECORD', label='C32', objectType='Button', midiType='Momentary', midi={0xBF,0x76,MIDI_LSB}},
			}
		}
end
