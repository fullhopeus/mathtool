-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Axiom 61',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Axiom 61', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=61, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Fader 9', label='Volume', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},

				{name='Fader 1', label='F1', objectType='VFader', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Fader 2', label='F2', objectType='VFader', midi={0xB0,0x47,MIDI_LSB}},
				{name='Fader 3', label='F3', objectType='VFader', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Fader 4', label='F4', objectType='VFader', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Fader 5', label='F5', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 6', label='F6', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 7', label='F7', objectType='VFader', midi={0xB0,0x05,MIDI_LSB}},
				{name='Fader 8', label='F8', objectType='VFader', midi={0xB0,0x54,MIDI_LSB}},

				{name='Knob 1', label='E1', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 2', label='E2', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Knob 3', label='E3', objectType='Knob', midi={0xB0,0x5C,MIDI_LSB}},
				{name='Knob 4', label='E4', objectType='Knob', midi={0xB0,0x5F,MIDI_LSB}},
				{name='Knob 5', label='E5', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 6', label='E6', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}},
				{name='Knob 7', label='E7', objectType='Knob', midi={0xB0,0x4E,MIDI_LSB}},
				{name='Knob 8', label='E8', objectType='Knob', midi={0xB0,0x4F,MIDI_LSB}},

				{name='LOOP', label='E9', objectType='Button', midiType='Momentary', midi={0xBF,0x71,MIDI_LSB}},
				{name='REWIND', label='E10', objectType='Button', midiType='Momentary', midi={0xBF,0x72,MIDI_LSB}},
				{name='FORWARD', label='E11', objectType='Button', midiType='Momentary', midi={0xBF,0x73,MIDI_LSB}},
				{name='STOP', label='E12', objectType='Button', midiType='Momentary', midi={0xBF,0x74,MIDI_LSB}},
				{name='PLAY', label='E13', objectType='Button', midiType='Momentary', midi={0xBF,0x75,MIDI_LSB}},
				{name='RECORD', label='E14', objectType='Button', midiType='Momentary', midi={0xBF,0x76,MIDI_LSB}},

				{name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}},
				{name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}},
				{name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}},
				{name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}},
				{name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}},
				{name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}},
				{name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}},
				{name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}},
			}
		}
end
