-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if midiEvent[0] == 0xF0 and midiEvent[1] == 0x7F and midiEvent[2] == 0x7F and midiEvent[3] == 0x04 and midiEvent[4] == 0x01 and midiEvent[7] == 0xF7 then
		return {midi={0xB0,0x07,midiEvent[6]}}
	end
	return nil
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'E-MU Xboard49',
		-- manufacturer name for this device
		manufacturer = 'E-MU Systems, Inc.',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x18,0x02,0x40,0x01,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='E-MU Xboard49', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Footswitch/Pedal', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Master Volume', label='Master Volume', objectType='Volume', midi={0xB0,0x07,MIDI_LSB}}, --midi={0xF0,0x7F,0x7F,0x04,0x01,MIDI_LSB,MIDI_MSB,0xF7}}

				{name='Knob 1', label='1', objectType='Knob', midi={0xB0,0x15,MIDI_LSB}},
				{name='Knob 2', label='2', objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},
				{name='Knob 3', label='3', objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},
				{name='Knob 4', label='4', objectType='Knob', midi={0xB0,0x18,MIDI_LSB}},
				{name='Knob 5', label='5', objectType='Knob', midi={0xB0,0x19,MIDI_LSB}},
				{name='Knob 6', label='6', objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Knob 7', label='7', objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Knob 8', label='8', objectType='Knob', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Knob 9', label='9', objectType='Knob', midi={0xB0,0x46,MIDI_LSB}},
				{name='Knob 10', label='10', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 11', label='11', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 12', label='12', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 13', label='13', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 14', label='14', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 15', label='15', objectType='Knob', midi={0xB0,0x52,MIDI_LSB}},
				{name='Knob 16', label='16', objectType='Knob', midi={0xB0,0x53,MIDI_LSB}},
			}
		}
end
