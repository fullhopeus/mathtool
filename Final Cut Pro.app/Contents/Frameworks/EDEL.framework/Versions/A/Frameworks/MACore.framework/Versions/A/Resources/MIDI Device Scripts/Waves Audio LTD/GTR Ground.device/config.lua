function make_event(id,parameter)
	return {0xF0,0x7F,0x00,0x20,0x66,id,parameter,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xF7}
end

lcdConversion = {
	[0x20] = { 0x00,0x00 },
	[0x21] = { 0x06,0x00 },
	[0x22] = { 0x20,0x04 },
	[0x23] = { 0x7F,0x7F },
	[0x24] = { 0x6D,0x25 },
	[0x25] = { 0x64,0x5B },
	[0x26] = { 0x0D,0x5A },
	[0x27] = { 0x00,0x08 },
	[0x28] = { 0x00,0x18 },
	[0x29] = { 0x00,0x42 },
	[0x2A] = { 0x40,0x7F },
	[0x2B] = { 0x40,0x25 },
	[0x2C] = { 0x00,0x40 },
	[0x2D] = { 0x40,0x01 },
	[0x2E] = { 0x58,0x20 },
	[0x2F] = { 0x00,0x48 },

	-- 0..9
	[0x30] = { 0x3F,0x48 },
	[0x31] = { 0x06,0x00 },
	[0x32] = { 0x5B,0x01 },
	[0x33] = { 0x0F,0x01 },
	[0x34] = { 0x26,0x01 },
	[0x35] = { 0x69,0x10 },
	[0x36] = { 0x7D,0x01 },
	[0x37] = { 0x07,0x00 },
	[0x38] = { 0x7F,0x01 },
	[0x39] = { 0x6F,0x01 },
	[0x3A] = { 0x00,0x24 },
	[0x3B] = { 0x00,0x44 },
	[0x3C] = { 0x00,0x18 },
	[0x3D] = { 0x48,0x01 },
	[0x3E] = { 0x00,0x42 },
	[0x3F] = { 0x03,0x21 },

	-- @,A..Z
	[0x40] = { 0x3B,0x05 },
	[0x41] = { 0x77,0x01 },
	[0x42] = { 0x0F,0x25 },
	[0x43] = { 0x39,0x00 },
	[0x44] = { 0x0F,0x24 },
	[0x45] = { 0x79,0x01 },
	[0x46] = { 0x71,0x00 },
	[0x47] = { 0x3D,0x01 },
	[0x48] = { 0x76,0x01 },
	[0x49] = { 0x00,0x24 },
	[0x4A] = { 0x1E,0x00 },
	[0x4B] = { 0x70,0x18 },
	[0x4C] = { 0x38,0x00 },
	[0x4D] = { 0x36,0x0A },
	[0x4E] = { 0x36,0x12 },
	[0x4F] = { 0x3F,0x00 },
	[0x50] = { 0x73,0x01 },
	[0x51] = { 0x3F,0x10 },
	[0x52] = { 0x73,0x11 },
	[0x53] = { 0x6D,0x01 },
	[0x54] = { 0x01,0x24 },
	[0x55] = { 0x3E,0x00 },
	[0x56] = { 0x30,0x48 },
	[0x57] = { 0x36,0x50 },
	[0x58] = { 0x00,0x5A },
	[0x59] = { 0x00,0x2A },
	[0x5A] = { 0x09,0x48 },

	[0x5B] = { 0x39,0x00 },
	[0x5C] = { 0x00,0x12 },
	[0x5D] = { 0x0F,0x00 },
	[0x5E] = { 0x03,0x48 },
	[0x5F] = { 0x08,0x00 },

	-- `,a..z
	[0x60] = { 0x00,0x02 },
	[0x61] = { 0x77,0x01 },
	[0x62] = { 0x0F,0x25 },
	[0x63] = { 0x39,0x00 },
	[0x64] = { 0x0F,0x24 },
	[0x65] = { 0x79,0x01 },
	[0x66] = { 0x71,0x00 },
	[0x67] = { 0x3D,0x01 },
	[0x68] = { 0x76,0x01 },
	[0x69] = { 0x00,0x24 },
	[0x6A] = { 0x1E,0x00 },
	[0x6B] = { 0x70,0x18 },
	[0x6C] = { 0x38,0x00 },
	[0x6D] = { 0x36,0x0A },
	[0x6E] = { 0x36,0x12 },
	[0x6F] = { 0x3F,0x00 },
	[0x70] = { 0x73,0x01 },
	[0x71] = { 0x3F,0x10 },
	[0x72] = { 0x73,0x11 },
	[0x73] = { 0x6D,0x01 },
	[0x74] = { 0x01,0x24 },
	[0x75] = { 0x3E,0x00 },
	[0x76] = { 0x30,0x48 },
	[0x77] = { 0x36,0x50 },
	[0x78] = { 0x00,0x5A },
	[0x79] = { 0x00,0x2A },
	[0x7A] = { 0x09,0x48 },

	[0x7B] = { 0x40,0x18 },
	[0x7C] = { 0x00,0x24 },
	[0x7D] = { 0x00,0x43 },
	[0x7E] = { 0x52,0x01 },
	[0x7F] = { 0x00,0x00 },
}

function make_lcd(id,str)
	midiEvent = make_event(id,0x00)
	cOffset = 9
	dotMask = 4
	for charIndex=1,8 do
		theChar = string.byte(str, charIndex);
		if theChar == nil then
			break
		end
		if theChar == 0x2E then
			if dotMask > 4 and dotMask < 128 then
				midiEvent[8] = midiEvent[8] + dotMask
			end
		elseif lcdConversion[theChar] ~= nil then
			if cOffset < 9+6 then
				midiEvent[cOffset] = lcdConversion[theChar][1]
				midiEvent[cOffset+1] = lcdConversion[theChar][2]
				cOffset = cOffset + 2
				dotMask = dotMask * 2
			end
		end
	end
	return midiEvent
end

-- Return MIDI event stream that configures the device to be used, this will be called _every_ time
-- when the app is launched or the device is connected.
function controller_initialize(applicationName)
	return {midi={	make_event(0x62,0),
					make_lcd(0x41,' ' .. string.sub(applicationName, 1, 1) .. ' '),make_event(0x51,0x0F),
					make_lcd(0x42,' ' .. string.sub(applicationName, 2, 2) .. ' '),make_event(0x52,0x0F),
					make_lcd(0x43,' ' .. string.sub(applicationName, 3, 3) .. ' '),make_event(0x53,0x0F),
					make_lcd(0x44,' ' .. string.sub(applicationName, 4, 4) .. ' '),make_event(0x54,0x0F),
					make_lcd(0x45,' ' .. string.sub(applicationName, 5, 5) .. ' '),make_event(0x55,0x0F),
					make_lcd(0x46,' ' .. string.sub(applicationName, 6, 6) .. ' '),make_event(0x56,0x0F),
					make_lcd(0x47,''),make_event(0x57,0x0F),
					}}
end

-- Return MIDI event stream that finializes the device after usage, this will be called _every_ time
-- when the app is terminated.
function controller_finalize()
	return {midi={	make_event(0x62,0),
					make_event(0x41,0),make_event(0x51,0),
					make_event(0x42,0),make_event(0x52,0),
					make_event(0x43,0),make_event(0x53,0),
					make_event(0x44,0),make_event(0x54,0),
					make_event(0x45,0),make_event(0x55,0),
					make_event(0x46,0),make_event(0x56,0),
					make_event(0x47,0),make_event(0x57,0),
					}}
end

updateObjectsAfterPatchChange = {}

-- Every MIDI event from this device that is an assignment is filtered through this function
function controller_midi_out(midiEvent,name,valueString,color)
	if midiEvent[0] == 0xB0 then
		-- remove already updated LEDs from the table
		updateObjectsAfterPatchChange[midiEvent[1]] = nil
		if midiEvent[1] >= 0x10 and midiEvent[1] <= 0x15 then	-- the buttons A-F
			if midiEvent[2] == 0x00 then
				return {midi={make_lcd(0x41+midiEvent[1]-0x10, string.sub(name, 1, 3)),make_event(0x51+midiEvent[1]-0x10,0x0F)}}
--				return {midi={make_lcd(0x41+midiEvent[1]-0x10,'OFF'),make_event(0x51+midiEvent[1]-0x10,0x09)}}
			else
				return {midi={make_lcd(0x41+midiEvent[1]-0x10, string.sub(name, 1, 3)),make_event(0x51+midiEvent[1]-0x10,0x0F)}}
--				return {midi={make_lcd(0x41+midiEvent[1]-0x10,'ON '),make_event(0x51+midiEvent[1]-0x10,0x0F)}}
			end
		elseif midiEvent[1] == 0x16 then						-- the button A/B
			if midiEvent[2] == 0x00 then
				return {midi={make_event(0x62,0)}}
			else
				return {midi={make_event(0x62,2)}}
			end
		end
	end
	return nil
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch(programchangeNumber, patchname, setname, concertname)
	if programchangeNumber < 0 then
		str = "---"
	else
		str = string.format("%03d", programchangeNumber)
	end

	-- turn the LEDs
	updateObjectsAfterPatchChange[0x10] = {midi={make_lcd(0x41, '')}}
	updateObjectsAfterPatchChange[0x11] = {midi={make_lcd(0x42, '')}}
	updateObjectsAfterPatchChange[0x12] = {midi={make_lcd(0x43, '')}}
	updateObjectsAfterPatchChange[0x13] = {midi={make_lcd(0x44, '')}}
	updateObjectsAfterPatchChange[0x14] = {midi={make_lcd(0x45, '')}}
	updateObjectsAfterPatchChange[0x15] = {midi={make_lcd(0x46, '')}}
	updateObjectsAfterPatchChange[0x16] = {midi={make_event(0x62,0)}}

	return {midi={make_lcd(0x47,str)}}
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch_done(programchangeNumber, patchname, setname, concertname)
	return updateObjectsAfterPatchChange
end

-- Return the list of valid controllers
function controller_names(channel)
	-- Tranzport sends only _one_ controller for the wheel
	if channel == 0 then
		return { [0x0E] = "Right Pedal",
		  		 [0x0F] = "Left Pedal",
		  		 [0x10] = "Button A",
		  		 [0x11] = "Button B",
		  		 [0x12] = "Button C",
		  		 [0x13] = "Button D",
		  		 [0x14] = "Button E",
		  		 [0x15] = "Button F",
		  		 [0x16] = "Button A/B",
		  		 [0x17] = "Button Down",
		  		 [0x18] = "Button Up",
		  		 [0x19] = "Button Preset/Stomp",
		  		 [0x1A] = "Button Tuner/Tap Tempo",
				}
	else
		return {}
	end
end

-- Return the list of valid controllers
function controller_note_names(channel)
	return {}
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'GTR Ground',
		-- manufacturer name for this device
		manufacturer = 'Waves Audio LTD.',

		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Left Pedal', objectType='Pedal', midi={0xB0,0x0F,MIDI_LSB}},
				{name='Right Pedal', objectType='Pedal', midi={0xB0,0x0E,MIDI_LSB}},

				{name='Button A', objectType='Button', midiType='Momentary', midi={0xB0,0x10,MIDI_LSB},outport=''},
				{name='Button B', objectType='Button', midiType='Momentary', midi={0xB0,0x11,MIDI_LSB},outport=''},
				{name='Button C', objectType='Button', midiType='Momentary', midi={0xB0,0x12,MIDI_LSB},outport=''},
				{name='Button D', objectType='Button', midiType='Momentary', midi={0xB0,0x13,MIDI_LSB},outport=''},
				{name='Button E', objectType='Button', midiType='Momentary', midi={0xB0,0x14,MIDI_LSB},outport=''},
				{name='Button F', objectType='Button', midiType='Momentary', midi={0xB0,0x15,MIDI_LSB},outport=''},
				{name='Button A/B', objectType='Button', midiType='Momentary', midi={0xB0,0x16,MIDI_LSB},outport=''},
				{name='Button Down', objectType='Button', midiType='Momentary', midi={0xB0,0x17,MIDI_LSB}},
				{name='Button Up', objectType='Button', midiType='Momentary', midi={0xB0,0x18,MIDI_LSB}},
				{name='Button Preset/Stomp', objectType='Button', midiType='Momentary', midi={0xB0,0x19,MIDI_LSB}},
				{name='Button Tuner/Tap Tempo', objectType='Button', midiType='Momentary', midi={0xB0,0x1A,MIDI_LSB}},
			}
		}
end
