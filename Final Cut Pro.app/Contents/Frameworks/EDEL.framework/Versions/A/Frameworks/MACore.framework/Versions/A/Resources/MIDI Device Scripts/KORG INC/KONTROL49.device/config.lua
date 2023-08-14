-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if midiEvent[0] == 0xF0 and midiEvent[1] == 0x42 and midiEvent[2] == 0x40 and midiEvent[3] == 0x6E and midiEvent[4] == 0x02 and midiEvent[8] == 0xF7 then

		if midiEvent[5] == 0x43 then		-- Encoder: 0..8 (1-8 and Main): 
			return {midi={0xB0,0x15+midiEvent[6],midiEvent[7]},inport="PORT B"}

		elseif midiEvent[5] == 0x44 then	-- Slider: 0..7: Value
			return {midi={0xB0,0x0D+midiEvent[6],midiEvent[7]},inport="PORT B"}

-- PADs send Note Events on Channel #10, we don't need SysEx for them
--		elseif midiEvent[5] == 0x45 then	-- Pad: 0..15 (Bit 6:Off/On): Velocity
--			return {midi={0xB0,0x07,midiEvent[7]},inport="PORT B"}

		elseif midiEvent[5] == 0x46 then	-- Wheel: 0:PitchBend, 1:ModWheel
			if midiEvent[6] == 1 then
				return {midi={0xB0,0x01,midiEvent[7]},inport="PORT B"}
-- PitchBend is send via PORT B, we can ignore the SysEx
--			else
--				return {midi={0xE0,midiEvent[7],midiEvent[7]},inport="PORT B"}
			end

		elseif midiEvent[5] == 0x47 then	-- Pedal: 0:Assignable SW, 1:Assignable Pedal
			if midiEvent[6] == 0 then
				return {midi={0xB0,0x40,midiEvent[7]},inport="PORT B"}	-- Switch: Sustain
			else
				return {midi={0xB0,0x0B,midiEvent[7]},inport="PORT B"}	-- Pedal: Expression
			end

		elseif midiEvent[5] == 0x48 then	-- SW: 0..9: <,>,ENTER,HEX LOCK,EXIT,SCENE,MESSAGE,SETTING,SW1,SW2
			return {midi={0xB0,0x41+midiEvent[6],midiEvent[7]},inport="PORT B"}

		elseif midiEvent[5] == 0x4B then	-- Joystick: X (0-127),Y (0-127)
			return {midi={0xB0,0x1F,midiEvent[7],0xB0,0x1E,midiEvent[6]},inport="PORT B"}	-- we send X last, so we can learn X. Y can never be learned

		end
		-- filter all remaining SysEx
		return {midi={}}
	end
	return nil	-- allow all other events
end

currentLCDValues = {}
updateObjects = {}
receivedEvents = false
updateObjectsAfterPatchChange = {}
insideSetup = false

-- Every MIDI event from this device is filtered through this function
function controller_timer_trigger()
	local returnObjects = updateObjects
	updateObjects = {}		-- we are done with the display update and empty the list
	currentLCDValues = {}
	return returnObjects
end

beatCounter = 0

buttonTranslationTable = { [0x41] = 0x18, [0x42] = 0x19, [0x43] = 0x14, [0x44] = 0x15, [0x45] = 0x13, [0x46] = 0x12, [0x48] = 0x10, [0x49] = 0x1B, [0x4A] = 0x1A }

-- Every MIDI event from this device that is an assignment is filtered through this function
function controller_midi_out(midiEvent,name,valueString,color)
	if midiEvent[0] == 0xF0 then
		return nil				-- always forward SysEx to the device, everything else either gets changed or filtered
	elseif midiEvent[0] == 0xB0 then
		receivedEvents = true
		if midiEvent[1] >= 0x41 and midiEvent[1] <= 0x49 then		-- the buttons

		else
			if insideSetup then		-- if we are inside the patch selection, we display the name immediately without a delay
				str = string.crunch(name, 8)
				if midiEvent[1] >= 0x15 and midiEvent[1] <= 0x1C then
					currentLCDValues[0x10 + (midiEvent[1] - 0x15)] = str
					updateObjectsAfterPatchChange[midiEvent[1] - 0x15] = {midi={0xf0,0x42,0x40,0x6E,0x02,0x22, 9, 0x10 + (midiEvent[1] - 0x15), string.crunch(name, 8), 0xf7}, outport='CTRL'}
			
				-- only set the LCD to the name of the parameter, if there is none on the knob
				elseif midiEvent[1] >= 0x0D and midiEvent[1] <= 0x14 and updateObjectsAfterPatchChange[midiEvent[1] - 0x0D] ~= nil then
					currentLCDValues[0x20 + (midiEvent[1] - 0x0D)] = str
					updateObjectsAfterPatchChange[midiEvent[1] - 0x0D] = {midi={0xf0,0x42,0x40,0x6E,0x02,0x22, 9, 0x20 + (midiEvent[1] - 0x0D), str, 0xf7}, outport='CTRL'}
				end
			else
				settriggertimer(1000)		-- call back in 1000ms
				if valueString ~= nil then
					str = string.crunch(valueString, 8)
				else
					str = string.crunch(string.format("%3d", midiEvent[2]), 8)
				end
				if midiEvent[1] >= 0x15 and midiEvent[1] <= 0x1C then
					updateObjects[midiEvent[1]] = {midi={0xf0,0x42,0x40,0x6E,0x02,0x22, 9, 0x10 + (midiEvent[1] - 0x15), string.crunch(name, 8), 0xf7}, outport='CTRL'}
					updateObjects[midiEvent[1] - 0x15 + 0x0D] = nil	-- remove the other controller that shares this display
					if currentLCDValues[0x10 + (midiEvent[1] - 0x15)] == str then
						return {}
					end
					currentLCDValues[0x10 + (midiEvent[1] - 0x15)] = str
					return {midi={0xf0,0x42,0x40,0x6E,0x02,0x22, 9, 0x10 + (midiEvent[1] - 0x15), str, 0xf7}, outport='CTRL'}
				elseif midiEvent[1] >= 0x0D and midiEvent[1] <= 0x14 then
					updateObjects[midiEvent[1]] = {midi={0xf0,0x42,0x40,0x6E,0x02,0x22, 9, 0x20 + (midiEvent[1] - 0x0D), string.crunch(name, 8), 0xf7}, outport='CTRL'}
					updateObjects[midiEvent[1] - 0x0D + 0x15] = nil	-- remove the other controller that shares this display
					if currentLCDValues[0x20 + (midiEvent[1] - 0x0D)] == str then
						return {}
					end
					currentLCDValues[0x20 + (midiEvent[1] - 0x0D)] = str
					return {midi={0xf0,0x42,0x40,0x6E,0x02,0x22, 9, 0x20 + (midiEvent[1] - 0x0D), str, 0xf7}, outport='CTRL'}
				end
			end
		end
	elseif midiEvent[0] == 0xF8 then		-- MIDI Beat Clock
		beatCounter = beatCounter + 1
		if beatCounter == 1 then
			-- TEMPO LED on
			return {midi={0xF8, 0xf0,0x42,0x40,0x6E,0x02,0x01, 0x16, 0x20, 0xf7}, outport='CTRL'}
		elseif beatCounter == 2 then
			-- TEMPO LED off
			return {midi={0xF8, 0xf0,0x42,0x40,0x6E,0x02,0x01, 0x16, 0x00, 0xf7}, outport='CTRL'}
		end
		if beatCounter > 24 then
			beatCounter = 0
		end
	elseif midiEvent[0] == 0x99 then		-- MIDI Channel #10 (Drum pads)
		receivedEvents = true
		if midiEvent[2] == 0x00 then
			return {midi={0xf0,0x42,0x40,0x6E,0x02,0x01, 0x00 + (midiEvent[1] - 0x3C), 0x00, 0xf7}, outport='CTRL'}
		else
			return {midi={0xf0,0x42,0x40,0x6E,0x02,0x01, 0x00 + (midiEvent[1] - 0x3C), 0x20, 0xf7}, outport='CTRL'}
		end
	end
	return {}	-- filter everything, that hasn't been processed, the controller ignores it anyway
end

-- Return MIDI event stream that configures the device to be used, this will be called _every_ time
-- when the app is launched or the device is connected.
function controller_initialize(applicationName,deviceNewlyDetected)
	currentLCDValues = {}
	if deviceNewlyDetected then
		return {midi={ -- enable native mode
			   		   -2000, -- 2000ms delay after the notification that the device appeared (power-on delay, this is only triggered when the device was connected while the app is already running)
					   0xf0,0x42,0x40,0x6E,0x02,0x00,0x00,0x01,0xf7,
			   		   -500, -- 500ms delay after switching to native mode
					   -- Native KORG mode Packet Communication 1st Data
					   0xF0,0x42,0x40,0x6E,0x02,0x3F,0x27,0x00, 0x00,	-- Transpose
																0x00,	-- Global MIDI channel (0..15)
																0x00,	-- PitchBend MIDI channel (0..15)
																0x7F,0x7F,0x03,																		-- PADs notes enabled
																0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,	-- PADs MIDI channel (0..15)
																0x3C,0x3D,0x3E,0x3F,0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x4B,	-- PADs MIDI notes
																0xF7,
					   -- Native KORG mode Packet Communication 2nd Data
					   0xF0,0x42,0x40,0x6E,0x02,0x3F,0x12,0x01, 0x00,0x00,0x00,0x00,	-- PAD and Main LEDs
																0x00,0x00,0x00,0x00,	-- SubLCD colors
																0x00,					-- Main LCD color
																'MainStge',				-- Main LCD text
																0xF7,
					   -- Native KORG mode Packet Communication 3rd Data (LCD 1..4)
					   0xF0,0x42,0x40,0x6E,0x02,0x3F,0x21,0x02, ' Native ', ' Native ', ' Native ', ' Native ', 0xF7,
					   -- Native KORG mode Packet Communication 4th Data (LCD 5..8)
					   0xF0,0x42,0x40,0x6E,0x02,0x3F,0x21,0x03, ' Native ', ' Native ', ' Native ', ' Native ', 0xF7,
					 }, outport='CTRL'}
	else
		return {midi={ -- enable native mode
					   0xf0,0x42,0x40,0x6E,0x02,0x00,0x00,0x01,0xf7,
			   		   -500, -- 500ms delay after switching to native mode
					   -- Native KORG mode Packet Communication 1st Data
					   0xF0,0x42,0x40,0x6E,0x02,0x3F,0x27,0x00, 0x00,	-- Transpose
																0x00,	-- Global MIDI channel (0..15)
																0x00,	-- PitchBend MIDI channel (0..15)
																0x7F,0x7F,0x03,																		-- PADs notes enabled
																0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,	-- PADs MIDI channel (0..15)
																0x3C,0x3D,0x3E,0x3F,0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x4B,	-- PADs MIDI notes
																0xF7,
					   -- Native KORG mode Packet Communication 2nd Data
					   0xF0,0x42,0x40,0x6E,0x02,0x3F,0x12,0x01, 0x00,0x00,0x00,0x00,	-- PAD and Main LEDs
																0x00,0x00,0x00,0x00,	-- SubLCD colors
																0x00,					-- Main LCD color
																' Native ',				-- Main LCD text
																0xF7,
					   -- Native KORG mode Packet Communication 3rd Data (LCD 1..4)
					   0xF0,0x42,0x40,0x6E,0x02,0x3F,0x21,0x02, ' Native ', ' Native ', ' Native ', ' Native ', 0xF7,
					   -- Native KORG mode Packet Communication 4th Data (LCD 5..8)
					   0xF0,0x42,0x40,0x6E,0x02,0x3F,0x21,0x03, ' Native ', ' Native ', ' Native ', ' Native ', 0xF7,
					 }, outport='CTRL'}
	end
end

-- Return MIDI event stream that finializes the device after usage, this will be called _every_ time
-- when the app is terminated.
function controller_finalize()
	return {midi={ -- disable native mode
				   0xf0,0x42,0x40,0x6E,0x02,0x00,0x00,0x00,0xf7
				 }, outport='CTRL'}
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch(programchangeNumber, patchname, setname, concertname)
	insideSetup = true
	receivedEvents = false

	-- initialize all displays with spaces and turn the LED light off
	for index=0,7 do
		updateObjectsAfterPatchChange[index] = {midi={0xf0,0x42,0x40,0x6E,0x02,0x22, 9, 0x00 + index, "        ", 0xf7}, outport='CTRL'}
	end

	-- display the patch name in the Main LCD
	return {midi={0xf0,0x42,0x40,0x6E,0x02,0x22, 9, 0x38, string.crunch(patchname, 8), 0xf7}, outport='CTRL'}
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch_done(programchangeNumber, patchname, setname, concertname)
	insideSetup = false
	if receivedEvents then
		return updateObjectsAfterPatchChange
	else
		return nil
	end
end

-- Return the list of valid controllers
function controller_names(channel)
	if channel == 0 then
		return { [-1] = "Pitch",
				  [1] = "ModWheel",
		  		 [11] = "Assignable Pedal", 
		 		 [13] = "Slider 1", [14] = "Slider 2", [15] = "Slider 3", [16] = "Slider 4", [17] = "Slider 5", [18] = "Slider 6", [19] = "Slider 7", [20] = "Slider 8",
				 [21] = "Encoder 1", [22] = "Encoder 2", [23] = "Encoder 3", [24] = "Encoder 4", [25] = "Encoder 5", [26] = "Encoder 6", [27] = "Encoder 7", [28] = "Encoder 8",
				 [29] = "Main Encoder",
				 [30] = "Joystick X", [31] = "Joystick Y", 
				 [64] = "Assignable Switch",
				 [67] = "ENTER", [68] = "HEX LOCK", [69] = "EXIT", [70] = "SCENE", [71] = "MESSAGE", [72] = "SETTING", [73] = "SW1", [74] = "SW2"
				}
	else
		return nil
	end
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Kontrol49',
		-- manufacturer name for this device
		manufacturer = 'Korg',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x42,0x6E,0x00,0x02,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}, inport="PORT B"},
				{name='Modulation', label='ModWheel', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}, inport="PORT B"},
				{name='Keyboard', label='Kontrol49', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}, inport="PORT B"},

				{name='Sustain Pedal', label='Assignable Switch', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}, inport="PORT B"},
				{name='Expression Pedal', label='Assignable Pedal', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}, inport="PORT B"},

				{name='Slider 8', objectType='VFader', midi={0xB0,0x14,MIDI_LSB}, inport="PORT B", outport="CTRL"},

				{name='Encoder 1', objectType='Knob', midiType='Relative2C', midi={0xB0,0x15,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Encoder 2', objectType='Knob', midiType='Relative2C', midi={0xB0,0x16,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Encoder 3', objectType='Knob', midiType='Relative2C', midi={0xB0,0x17,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Encoder 4', objectType='Knob', midiType='Relative2C', midi={0xB0,0x18,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Encoder 5', objectType='Knob', midiType='Relative2C', midi={0xB0,0x19,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Encoder 6', objectType='Knob', midiType='Relative2C', midi={0xB0,0x1A,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Encoder 7', objectType='Knob', midiType='Relative2C', midi={0xB0,0x1B,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Encoder 8', objectType='Knob', midiType='Relative2C', midi={0xB0,0x1C,MIDI_LSB}, inport="PORT B", outport="CTRL"},

				{name='Slider 1', objectType='VFader', midi={0xB0,0x0D,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Slider 2', objectType='VFader', midi={0xB0,0x0E,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Slider 3', objectType='VFader', midi={0xB0,0x0F,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Slider 4', objectType='VFader', midi={0xB0,0x10,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Slider 5', objectType='VFader', midi={0xB0,0x11,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Slider 6', objectType='VFader', midi={0xB0,0x12,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Slider 7', objectType='VFader', midi={0xB0,0x13,MIDI_LSB}, inport="PORT B", outport="CTRL"},

				{name='Main Encoder', objectType='Knob', midiType='Relative2C', midi={0xB0,0x1D,MIDI_LSB}, inport="PORT B", outport="CTRL"},

				{name='Joystick X', objectType='VFader', midi={0xB0,0x1E,MIDI_LSB}, inport="PORT B"},
				{name='Joystick Y', objectType='VFader', midi={0xB0,0x1F,MIDI_LSB}, inport="PORT B"},

				{name='SETTING', label='SETTING', objectType='Button', midiType='Momentary', midi={0xB0,0x48,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='MESSAGE', label='MESSAGE', objectType='Button', midiType='Momentary', midi={0xB0,0x47,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='SCENE', label='SCENE', objectType='Button', midiType='Momentary', midi={0xB0,0x46,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='EXIT', label='EXIT', objectType='Button', midiType='Momentary', midi={0xB0,0x45,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='HEX LOCK', label='HEX LOCK', objectType='Button', midiType='Momentary', midi={0xB0,0x44,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='ENTER', label='ENTER', objectType='Button', midiType='Momentary', midi={0xB0,0x43,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='SW1', label='SW1', objectType='Button', midiType='Momentary', midi={0xB0,0x4A,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='SW2', label='SW2', objectType='Button', midiType='Momentary', midi={0xB0,0x49,MIDI_LSB}, inport="PORT B", outport="CTRL"},

				{name='Pad 13', label='C', objectType='Drumpad', midiType='Note', midi={0x99,0x3C,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 14', label='D', objectType='Drumpad', midiType='Note', midi={0x99,0x3D,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 15', label='E', objectType='Drumpad', midiType='Note', midi={0x99,0x3E,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 16', label='F', objectType='Drumpad', midiType='Note', midi={0x99,0x3F,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 9', label='8', objectType='Drumpad', midiType='Note', midi={0x99,0x40,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 10', label='9', objectType='Drumpad', midiType='Note', midi={0x99,0x41,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 11', label='A', objectType='Drumpad', midiType='Note', midi={0x99,0x42,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 12', label='B', objectType='Drumpad', midiType='Note', midi={0x99,0x43,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 5', label='4', objectType='Drumpad', midiType='Note', midi={0x99,0x44,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 6', label='5', objectType='Drumpad', midiType='Note', midi={0x99,0x45,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 7', label='6', objectType='Drumpad', midiType='Note', midi={0x99,0x46,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 8', label='7', objectType='Drumpad', midiType='Note', midi={0x99,0x47,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 1', label='0', objectType='Drumpad', midiType='Note', midi={0x99,0x48,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 2', label='1', objectType='Drumpad', midiType='Note', midi={0x99,0x49,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 3', label='2', objectType='Drumpad', midiType='Note', midi={0x99,0x4A,MIDI_LSB}, inport="PORT B", outport="CTRL"},
				{name='Pad 4', label='3', objectType='Drumpad', midiType='Note', midi={0x99,0x4B,MIDI_LSB}, inport="PORT B", outport="CTRL"},
			}
		}
end
