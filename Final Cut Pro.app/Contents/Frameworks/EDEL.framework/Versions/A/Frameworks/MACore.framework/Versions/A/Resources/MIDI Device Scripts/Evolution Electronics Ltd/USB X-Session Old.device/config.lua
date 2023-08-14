-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if midiEvent[0] == 0xB0 then
		if midiEvent[1] == 0x0E or midiEvent[1] == 0x0F or midiEvent[1] >= 0x50 then
			if midiEvent[2] ~= 0x00 then
				return {midi={0xB0,midiEvent[1],0x7F}}
			end
		end
	end
	return nil
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'USB X-Session',
		-- manufacturer name for this device
		manufacturer = 'Evolution Electronics Ltd.',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x4D,0x14,0x71,0x01,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Fader', objectType='Volume', midi={0xB0,0x0A,MIDI_LSB}},

				{name='Knob 1',  label='C1',  objectType='Knob', midi={0xB0,0x10,MIDI_LSB}},
				{name='Knob 2',  label='C2',  objectType='Knob', midi={0xB0,0x11,MIDI_LSB}},
				{name='Knob 3',  label='C3',  objectType='Knob', midi={0xB0,0x12,MIDI_LSB}},
				{name='Knob 4',  label='C4',  objectType='Knob', midi={0xB0,0x13,MIDI_LSB}},
				{name='Knob 5',  label='C5',  objectType='Knob', midi={0xB0,0x14,MIDI_LSB}},
				{name='Knob 6',  label='C6',  objectType='Knob', midi={0xB0,0x15,MIDI_LSB}},
				{name='Knob 7',  label='C7',  objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},
				{name='Knob 8',  label='C8',  objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},
				{name='Knob 9',  label='C9',  objectType='Knob', midi={0xB0,0x18,MIDI_LSB}},
				{name='Knob 10', label='C10', objectType='Knob', midi={0xB0,0x19,MIDI_LSB}},
				{name='Knob 11', label='C11', objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Knob 12', label='C12', objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Knob 13', label='C13', objectType='Knob', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Knob 14', label='C14', objectType='Knob', midi={0xB0,0x1D,MIDI_LSB}},
				{name='Knob 15', label='C15', objectType='Knob', midi={0xB0,0x1E,MIDI_LSB}},
				{name='Knob 16', label='C16', objectType='Knob', midi={0xB0,0x1F,MIDI_LSB}},

				{name='Button 1',  label='1', objectType='Button', midiType='Alternating', midi={0xB0,0x0F,MIDI_LSB}},
				{name='Button 2',  label='2', objectType='Button', midiType='Alternating', midi={0xB0,0x55,MIDI_LSB}},
				{name='Button 3',  label='3', objectType='Button', midiType='Alternating', midi={0xB0,0x56,MIDI_LSB}},
				{name='Button 4',  label='4', objectType='Button', midiType='Alternating', midi={0xB0,0x57,MIDI_LSB}},
				{name='Button 5',  label='5', objectType='Button', midiType='Alternating', midi={0xB0,0x58,MIDI_LSB}},
				{name='Button 6',  label='6', objectType='Button', midiType='Alternating', midi={0xB0,0x59,MIDI_LSB}},
				{name='Button 7',  label='7', objectType='Button', midiType='Alternating', midi={0xB0,0x5A,MIDI_LSB}},
				{name='Button 8',  label='8', objectType='Button', midiType='Alternating', midi={0xB0,0x76,MIDI_LSB}},
				{name='Button 9',  label='9', objectType='Button', midiType='Alternating', midi={0xB0,0x77,MIDI_LSB}},
				{name='Button 10', label='0', objectType='Button', midiType='Alternating', midi={0xB0,0x0E,MIDI_LSB}},
			}
		}
end
