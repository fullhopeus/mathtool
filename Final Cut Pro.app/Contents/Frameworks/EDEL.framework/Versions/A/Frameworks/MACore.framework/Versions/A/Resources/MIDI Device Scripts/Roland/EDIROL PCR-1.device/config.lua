regNumberLSB = -1
regNumberMSB = -1

-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	-- convert Button 6 "GM 2 On" into CC #65
	if midiEvent[0] == 0xF0 and midiEvent[1] == 0x7E and midiEvent[2] == 0x7F and midiEvent[3] == 0x09 and midiEvent[4] == 0x03 and midiEvent[5] == 0xF7 then
		return {midi={0xB0,0x42,0x7F}}
	end
	if midiEvent[0] == 0xB0 then
		-- store registered parameter #
		if midiEvent[1] == 0x64 then
			regNumberLSB = midiEvent[2]
			return {midi={}}	-- ignore this event
		elseif midiEvent[1] == 0x65 then
			regNumberMSB = midiEvent[2]
			return {midi={}}	-- ignore this event
		elseif midiEvent[1] == 0x26 then
			return {midi={}}	-- ignore this event
		elseif midiEvent[1] == 0x06 then
			if regNumberMSB == 0 then
				if regNumberLSB == 2 then					-- Knob 6 / R6
					return {midi={0xB0,0x10,midiEvent[2]}}
				elseif regNumberLSB == 1 then				-- Knob 7 / R7
					return {midi={0xB0,0x11,midiEvent[2]}}
				end
			end
			return {midi={}}	-- ignore this event
		end
		regNumberLSB = -1
		regNumberMSB = -1
	end
	return nil
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'EDIROL PCR-1',
		-- manufacturer name for this device
		manufacturer = 'Roland',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 0',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x10,0x06,0x02,0x41,0x62,0x01,0x00,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Keyboard', label='EDIROL PCR-1', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=24, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}, inport='EDIROL PCR-1 1'},

				{name='Knob 8', label='Volume', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}, inport='EDIROL PCR-1 1'},

				{name='Knob 1', label='R1', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Knob 2', label='R2', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Knob 3', label='R3', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Knob 4', label='R4', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Knob 5', label='R5', objectType='Knob', midi={0xB0,0x4E,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Knob 6', label='R6', objectType='Knob', midi={0xB0,0x10,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Knob 7', label='R7', objectType='Knob', midi={0xB0,0x11,MIDI_LSB}, inport='EDIROL PCR-1 1'},

				{name='Program Down', label='B1', objectType='Button', midiType='Ignore', midi={0xC0,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Program Up', label='B2', objectType='Button', midiType='Ignore', midi={0xC0,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Button 3', label='B3', objectType='Button', midiType='Alternating', midi={0xB0,0x41,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Button 4', label='B4', objectType='Button', midiType='Single', midi={0xB0,0x7F,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Button 5', label='B5', objectType='Button', midiType='Single', midi={0xB0,0x7E,MIDI_LSB}, inport='EDIROL PCR-1 1'},
				{name='Button 6', label='B6', objectType='Button', midiType='Single', midi={0xB0,0x42,MIDI_LSB}, inport='EDIROL PCR-1 1'},
		}
	}
end
