-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Axiom 25',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Patch 1',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Axiom 25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Volume', label='Volume', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},
				
				{name='Knob 1', label='1', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 2', label='2', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 3', label='3', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 4', label='4', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 5', label='5', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 6', label='6', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 7', label='7', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 8', label='8', objectType='Knob', midi={0xB0,0x54,MIDI_LSB}},

				{name='CYCLE', 	 label='CYCLE', 	objectType='Button', midiType='Momentary', midi={0xBF,0x71,MIDI_LSB}},
				{name='REWIND',  label='REWIND', 	objectType='Button', midiType='Momentary', midi={0xBF,0x72,MIDI_LSB}},
				{name='FORWARD', label='FORWARD', 	objectType='Button', midiType='Momentary', midi={0xBF,0x73,MIDI_LSB}},
				{name='STOP', 	 label='STOP', 		objectType='Button', midiType='Momentary', midi={0xBF,0x74,MIDI_LSB}},
				{name='PLAY', 	 label='PLAY', 		objectType='Button', midiType='Momentary', midi={0xBF,0x75,MIDI_LSB}},
				{name='RECORD',  label='RECORD', 	objectType='Button', midiType='Momentary', midi={0xBF,0x76,MIDI_LSB}},

				{name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0xA0,0x3A,MIDI_LSB}},
				{name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0xA0,0x27,MIDI_LSB}},
				{name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0xA0,0x35,MIDI_LSB}},
				{name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0xA0,0x39,MIDI_LSB}},
				{name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0xA0,0x24,MIDI_LSB}},
				{name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0xA0,0x28,MIDI_LSB}},
				{name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0xA0,0x2A,MIDI_LSB}},
				{name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0xA0,0x2E,MIDI_LSB}},
			}
		}
end
