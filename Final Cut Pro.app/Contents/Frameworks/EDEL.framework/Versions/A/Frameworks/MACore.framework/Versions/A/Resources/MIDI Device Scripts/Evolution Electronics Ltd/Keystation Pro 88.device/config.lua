-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if midiEvent[0] == 0xF0 and midiEvent[1] == 0x7F and midiEvent[2] == 0x7F and midiEvent[3] == 0x06 and midiEvent[5] == 0xF7 then
		if midiEvent[4] == 0x05 then
			return {midi={0xB0,0x56,0x7F}}
		end
		if midiEvent[4] == 0x04 then
			return {midi={0xB0,0x57,0x7F}}
		end
		if midiEvent[4] == 0x01 then
			return {midi={0xB0,0x58,0x7F}}
		end
		if midiEvent[4] == 0x02 then
			return {midi={0xB0,0x59,0x7F}}
		end
		if midiEvent[4] == 0x06 then
			return {midi={0xB0,0x5A,0x7F}}
		end
	end
	return nil
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Keystation Pro 88',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- This device does active sense
		active_sense = true,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Keystation', objectType='Keyboard', midiType='Keyboard', startKey=21, numberKeys=88, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='A37', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Soft Pedal', label='A38', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x43,MIDI_LSB}},
				{name='Expression Pedal', label='A36', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Button 1', label='A39', objectType='Button', midiType='Single', midi={0xB0,0x56,MIDI_LSB}},
				{name='Button 2', label='A40', objectType='Button', midiType='Single', midi={0xB0,0x57,MIDI_LSB}},
				{name='Button 3', label='A41', objectType='Button', midiType='Single', midi={0xB0,0x58,MIDI_LSB}},
				{name='Button 4', label='A42', objectType='Button', midiType='Single', midi={0xB0,0x59,MIDI_LSB}},
				{name='Button 5', label='A43', objectType='Button', midiType='Single', midi={0xB0,0x5A,MIDI_LSB}},

				{name='Fader 1', label='C1', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 2', label='C2', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 3', label='C3', objectType='VFader', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Fader 4', label='C4', objectType='VFader', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Fader 5', label='C5', objectType='VFader', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Fader 6', label='C6', objectType='VFader', midi={0xB0,0x47,MIDI_LSB}},
				{name='Fader 7', label='C7', objectType='VFader', midi={0xB0,0x05,MIDI_LSB}},
				{name='Fader 8', label='C8', objectType='VFader', midi={0xB0,0x54,MIDI_LSB}},
				{name='Fader 9', label='C9', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1',  label='B10', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
				{name='Knob 2',  label='B11', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}},
				{name='Knob 3',  label='B12', objectType='Knob', midi={0xB0,0x0C,MIDI_LSB}},
				{name='Knob 4',  label='B13', objectType='Knob', midi={0xB0,0x0D,MIDI_LSB}},
				{name='Knob 5',  label='B14', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 6',  label='B15', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Knob 7',  label='B16', objectType='Knob', midi={0xB0,0x5C,MIDI_LSB}},
				{name='Knob 8',  label='B17', objectType='Knob', midi={0xB0,0x5F,MIDI_LSB}},

				{name='Knob 9',  label='B18', objectType='Knob', midi={0xB0,0x2A,MIDI_LSB}},
				{name='Knob 10', label='B19', objectType='Knob', midi={0xB0,0x22,MIDI_LSB}},
				{name='Knob 11', label='B20', objectType='Knob', midi={0xB0,0x2C,MIDI_LSB}},
				{name='Knob 12', label='B21', objectType='Knob', midi={0xB0,0x2D,MIDI_LSB}},
				{name='Knob 13', label='B22', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}},
				{name='Knob 14', label='B23', objectType='Knob', midi={0xB0,0x4E,MIDI_LSB}},
				{name='Knob 15', label='B24', objectType='Knob', midi={0xB0,0x4F,MIDI_LSB}},
				{name='Knob 16', label='B25', objectType='Knob', midi={0xB0,0x5E,MIDI_LSB}},

				{name='Knob 17', label='B26', objectType='Knob', midi={0xB0,0x10,MIDI_LSB}},
				{name='Knob 18', label='B27', objectType='Knob', midi={0xB0,0x11,MIDI_LSB}},
				{name='Knob 19', label='B28', objectType='Knob', midi={0xB0,0x12,MIDI_LSB}},
				{name='Knob 20', label='B29', objectType='Knob', midi={0xB0,0x13,MIDI_LSB}},
				{name='Knob 21', label='B30', objectType='Knob', midi={0xB0,0x50,MIDI_LSB}},
				{name='Knob 22', label='B31', objectType='Knob', midi={0xB0,0x51,MIDI_LSB}},
				{name='Knob 23', label='B32', objectType='Knob', midi={0xD0,MIDI_LSB}},
				{name='Knob 24', label='B33', objectType='Knob', midi={0xB0,0x06,MIDI_LSB}},
			}
		}
end
