-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'CME UF MIDI Device',
		-- manufacturer name for this device
		manufacturer = 'Central Music Co.',

		-- Keyboard sense Active Sense and Clock

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='CME UF MIDI Device', objectType='Keyboard', midiType='Keyboard', startKey=21, numberKeys=88, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='M.Volume', objectType='Volume', midi={0xB0,0x27,MIDI_LSB}},

				{name='Fader 1', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},
				{name='Fader 2', objectType='VFader', midi={0xB1,0x07,MIDI_LSB}},
				{name='Fader 3', objectType='VFader', midi={0xB2,0x07,MIDI_LSB}},
				{name='Fader 4', objectType='VFader', midi={0xB3,0x07,MIDI_LSB}},
				{name='Fader 5', objectType='VFader', midi={0xB4,0x07,MIDI_LSB}},
				{name='Fader 6', objectType='VFader', midi={0xB5,0x07,MIDI_LSB}},
				{name='Fader 7', objectType='VFader', midi={0xB6,0x07,MIDI_LSB}},
				{name='Fader 8', objectType='VFader', midi={0xB7,0x07,MIDI_LSB}},

				{name='Knob 1 A', label='Cutoff', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 2 A', label='Resonance', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 3 A', label='Attack', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 4 A', label='Release', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 5 A', label='Pan', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 6 A', label='Reverb', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 7 A', label='Chorus', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 8 A', label='Tempo', objectType='Knob', midiType='Ignore'},				-- adjust the MIDI clock from 20..250

--				{name='Top', objectType='Button', midiType='Single', midi={0xB0,0x73,MIDI_LSB}},	-- works once after "Forward" has been pressed
--				{name='Rewind', objectType='Button', midiType='Single', midi={0xB0,0x74,MIDI_LSB}},	-- works as often as "Forward" was pressed, then returns 'Top'
--				{name='Forward', objectType='Button', midiType='Single', midi={0xB0,0x75,MIDI_LSB}},-- works all the time
--				{name='Record', objectType='Button', midiType='Single', midi={0xB0,0x72,MIDI_LSB}},	-- works all the time, blinks if in "Stop" mode, constant when in "Play" mode
--				{name='Stop', objectType='Button', midiType='Single', midi={0xB0,0x76,MIDI_LSB}},	-- works all the time
--				{name='Play', objectType='Button', midiType='Single', midi={0xB0,0x77,MIDI_LSB}},	-- turns on LED, works once - "Stop" resets it
			}
		}
end
