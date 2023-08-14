-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'IMPACT LX49',
		-- manufacturer name for this device
		manufacturer = 'Nektar',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='IMPACT LX49', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Fader 9', label='Volume ', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},

				{name='Fader 1', label='C1', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 2', label='C2', objectType='VFader', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Fader 3', label='C3', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 4', label='C4', objectType='VFader', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Fader 5', label='C5', objectType='VFader', midi={0xB0,0x5C,MIDI_LSB}},
				{name='Fader 6', label='C6', objectType='VFader', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Fader 7', label='C7', objectType='VFader', midi={0xB0,0x5E,MIDI_LSB}},
				{name='Fader 8', label='C8', objectType='VFader', midi={0xB0,0x5F,MIDI_LSB}},

				{name='Bank >', label='B1', objectType='Button', midiType='Alternating', midi={0xB0,0x00,MIDI_LSB}},
				{name='Bank <', label='B2', objectType='Button', midiType='Alternating', midi={0xB0,0x02,MIDI_LSB}},
				{name='Button 3', label='B3', objectType='Button', midiType='Alternating', midi={0xB0,0x03,MIDI_LSB}},
				{name='Button 4', label='B4', objectType='Button', midiType='Alternating', midi={0xB0,0x04,MIDI_LSB}},
				{name='Button 5', label='B5', objectType='Button', midiType='Alternating', midi={0xB0,0x06,MIDI_LSB}},
				{name='Button 6', label='B6', objectType='Button', midiType='Alternating', midi={0xB0,0x08,MIDI_LSB}},
				{name='Button 7', label='B7', objectType='Button', midiType='Alternating', midi={0xB0,0x09,MIDI_LSB}},
				{name='Button 8', label='B8', objectType='Button', midiType='Alternating', midi={0xB0,0x0B,MIDI_LSB}},
				{name='Button 9', label='B9', objectType='Button', midiType='Alternating', midi={0xB0,0x41,MIDI_LSB}},
				-- Knob Row 1
				{name='Knob 1', label='C10', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 2', label='C11', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 3', label='C12', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 4', label='C13', objectType='Knob', midi={0xB0,0x54,MIDI_LSB}},
				-- Knob Row 2
				{name='Knob 5', label='C14', objectType='Knob', midi={0xB0,0x4E,MIDI_LSB}},
				{name='Knob 6', label='C15', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Knob 7', label='C16', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}},
				{name='Knob 8', label='C17', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				-- Transport Controls
				{name='LOOP', label='LOOP', objectType='Button', midiType='Momentary', midi={0xBF,0x66,MIDI_LSB}, inport="Port 2"},
				{name='REWIND', label='REWIND', objectType='Button', midiType='Momentary', midi={0xBF,0x67,MIDI_LSB}, inport="Port 2"},
				{name='FORWARD', label='FORWARD', objectType='Button', midiType='Momentary', midi={0xBF,0x68,MIDI_LSB}, inport="Port 2"},
				{name='STOP', label='STOP', objectType='Button', midiType='Momentary', midi={0xBF,0x69,MIDI_LSB}, inport="Port 2"},
				{name='PLAY', label='PLAY', objectType='Button', midiType='Momentary', midi={0xBF,0x6A,MIDI_LSB}, inport="Port 2"},
				{name='RECORD', label='RECORD', objectType='Button', midiType='Momentary', midi={0xBF,0x6B,MIDI_LSB}, inport="Port 2"},
				-- Pad Row 1
				{name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0x90,0x29,MIDI_LSB}},
				{name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0x90,0x2A,MIDI_LSB}},
				{name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},
				{name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0x90,0x2C,MIDI_LSB}},
				-- Pad Row 2
				{name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				{name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				{name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				{name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},
			}
		}
end
