-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'The Laboratory',
		-- manufacturer name for this device
		manufacturer = 'Arturia',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='The Laboratory', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=61, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Knob1', label='Volume', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 2', label='Cutoff', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 3', label='Resonance', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 4', label='LFO Rate', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Knob 5', label='LFO Amount', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}},
				{name='Knob 6', label='Chorus Mix', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},

				{name='Knob 7', label='Param 1', objectType='Knob', midi={0xB0,0x12,MIDI_LSB}},
				{name='Knob 8', label='Param 2', objectType='Knob', midi={0xB0,0x13,MIDI_LSB}},
				{name='Knob 9', label='Param 3', objectType='Knob', midi={0xB0,0x10,MIDI_LSB}},
				{name='Knob 10', label='Param 4', objectType='Knob', midi={0xB0,0x11,MIDI_LSB}},
				{name='Knob 11', label='Delay Mix', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},


				{name='Fader 1', label='Attack 1', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 2', label='Decay 1', objectType='VFader', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Fader 3', label='Sustain 1', objectType='VFader', midi={0xB0,0x4F,MIDI_LSB}},
				{name='Fader 4', label='Release 1', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 5', label='Attack 2', objectType='VFader', midi={0xB0,0x50,MIDI_LSB}},
				{name='Fader 6', label='Decay 2', objectType='VFader', midi={0xB0,0x51,MIDI_LSB}},
				{name='Fader 7', label='Sustain 2', objectType='VFader', midi={0xB0,0x52,MIDI_LSB}},
				{name='Fader 8', label='Release 2', objectType='VFader', midi={0xB0,0x53,MIDI_LSB}},
				{name='Fader 9', label='Tempo', objectType='VFader', midi={0xB0,0x55,MIDI_LSB}},

				{name='Button 1', label='1', objectType='Button', midiType='Momentary', midi={0xB0,0x16,MIDI_LSB}},
				{name='Button 2', label='2', objectType='Button', midiType='Momentary', midi={0xB0,0x17,MIDI_LSB}},
				{name='Button 3', label='3', objectType='Button', midiType='Momentary', midi={0xB0,0x18,MIDI_LSB}},
				{name='Button 4', label='4', objectType='Button', midiType='Momentary', midi={0xB0,0x19,MIDI_LSB}},
				{name='Button 5', label='5', objectType='Button', midiType='Momentary', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Button 6', label='6', objectType='Button', midiType='Momentary', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Button 7', label='7', objectType='Button', midiType='Momentary', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Button 8', label='8', objectType='Button', midiType='Momentary', midi={0xB0,0x1D,MIDI_LSB}},
				{name='Button 9', label='9', objectType='Button', midiType='Momentary', midi={0xB0,0x1E,MIDI_LSB}},
				{name='Button 10', label='10', objectType='Button', midiType='Momentary', midi={0xB0,0x1F,MIDI_LSB}},

				{name='PLAY', label='PLAY', objectType='Button', midiType='Momentary', midi={0xB0,0x32,MIDI_LSB}},
				{name='STOP', label='STOP', objectType='Button', midiType='Momentary', midi={0xB0,0x33,MIDI_LSB}},
				{name='RECORD', label='RECORD', objectType='Button', midiType='Momentary', midi={0xB0,0x34,MIDI_LSB}},
				{name='REWIND', label='REWIND', objectType='Button', midiType='Momentary', midi={0xB0,0x35,MIDI_LSB}},
				{name='FORWARD', label='FORWARD', objectType='Button', midiType='Momentary', midi={0xB0,0x36,MIDI_LSB}},
				{name='CYCLE', label='CYCLE', objectType='Button', midiType='Momentary', midi={0xB0,0x37,MIDI_LSB}},

				{name='Sound', label='Sound', objectType='Button', midiType='Momentary', midi={0xB0,0x76,MIDI_LSB}},
				{name='Scene', label='Scene', objectType='Button', midiType='Momentary', midi={0xB0,0x77,MIDI_LSB}},
				{name='Endless Knob 1', label='Category', objectType='Knob', midiType='DirectionAndSpeed', midi={0xB0,0x70,MIDI_LSB}},
				{name='Endless Knob 2', label='Preset', objectType='Knob', midiType='DirectionAndSpeed', midi={0xB0,0x72,MIDI_LSB}},

				{name='Mod Upper', label='Mod Upper', objectType='Button', midiType='Momentary', midi={0xB0,0x2F,MIDI_LSB}},
				{name='Mod Lower', label='Scene', objectType='Button', midiType='Momentary', midi={0xB1,0x2E,MIDI_LSB}},

				{name='Pad 1', label='Drumpad 1', objectType='Drumpad', midiType='Note', midi={0x99,0x7C,MIDI_LSB}},
				{name='Pad 2', label='Drumpad 2', objectType='Drumpad', midiType='Note', midi={0x99,0x7D,MIDI_LSB}},
				{name='Pad 3', label='Drumpad 3', objectType='Drumpad', midiType='Note', midi={0x99,0x7E,MIDI_LSB}},
				{name='Pad 4', label='Drumpad 4', objectType='Drumpad', midiType='Note', midi={0x99,0x7F,MIDI_LSB}},
			}
		}
end
