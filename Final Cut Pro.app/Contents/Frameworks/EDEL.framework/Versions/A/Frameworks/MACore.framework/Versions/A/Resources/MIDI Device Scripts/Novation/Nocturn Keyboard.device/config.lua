-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	-- ignore CC Bank Select MSB
	if midiEvent[0] == 0xB0 and midiEvent[1] == 0x00 then
		return nil
	end
	-- change Bank Select LSB to CC #12
	if midiEvent[0] == 0xB0 and midiEvent[1] == 0x20 then
   		return {midi={0xB0,0x0C,midiEvent[2]}}
	end
	return nil
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Nocturn 25',
		-- manufacturer name for this device
		manufacturer = 'Novation',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Nocturn 25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain Pedal', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expression Pedal', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Knob 1', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},
				{name='Knob 2', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 3', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 4', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 5', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 6', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 7', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 8', objectType='Knob', midi={0xB0,0x5C,MIDI_LSB}},

				{name='Speed Dial', objectType='Knob', midi={0xB0,0x0C,MIDI_LSB}},

				{name='PLAY', objectType='Button', midiType='Alternating', midi={0xB0,0x1C,MIDI_LSB}},
				{name='STOP', objectType='Button', midiType='Alternating', midi={0xB0,0x1D,MIDI_LSB}},
				{name='RECORD', objectType='Button', midiType='Alternating', midi={0xB0,0x56,MIDI_LSB}},
				{name='REWIND', objectType='Button', midiType='Alternating', midi={0xB0,0x1E,MIDI_LSB}},
				{name='FORWARD', objectType='Button', midiType='Alternating', midi={0xB0,0x1F,MIDI_LSB}},
				{name='LOOP', objectType='Button', midiType='Alternating', midi={0xB0,0x55,MIDI_LSB}},

				{name='1', objectType='Button', midiType='Alternating', midi={0xB0,0x33,MIDI_LSB}},
				{name='2', objectType='Button', midiType='Alternating', midi={0xB0,0x34,MIDI_LSB}},
				{name='3', objectType='Button', midiType='Alternating', midi={0xB0,0x35,MIDI_LSB}},
				{name='4', objectType='Button', midiType='Alternating', midi={0xB0,0x36,MIDI_LSB}},
				{name='5', objectType='Button', midiType='Alternating', midi={0xB0,0x37,MIDI_LSB}},
				{name='6', objectType='Button', midiType='Alternating', midi={0xB0,0x38,MIDI_LSB}},
				{name='7', objectType='Button', midiType='Alternating', midi={0xB0,0x39,MIDI_LSB}},
				{name='8', objectType='Button', midiType='Alternating', midi={0xB0,0x3A,MIDI_LSB}},

				{name='Pad 1', label='1', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}},
				{name='Pad 2', label='2', objectType='Drumpad', midiType='Note', midi={0x99,0x2F,MIDI_LSB}},
				{name='Pad 3', label='3', objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}},
				{name='Pad 4', label='4', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}},
				{name='Pad 5', label='5', objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}},
				{name='Pad 6', label='6', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}},
				{name='Pad 7', label='7', objectType='Drumpad', midiType='Note', midi={0x99,0x28,MIDI_LSB}},
				{name='Pad 8', label='8', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}},
			}
		}
end
