KONTROL_SERIES = 0x60 -- KONTROL S61

ROOT_KEY_REPORT_ID  = 0x01
BUTTON_REPORT_ID	= 0x02
KEYBED_REPORT_ID 	= 0x03
TOP_LABEL_REPORT_ID = 0x04
BOT_LABEL_REPORT_ID = 0x05
BARS_REPORT_ID 		= 0x06
SECTION_REPORT_ID   = 0x07

SYSEX_END = 0xF7

BUTTON_MSG = {	0xF0,
				0x00,0x21,0x09,
				0x13,KONTROL_SERIES,0x4D,0x50, 0x00,0x01,
				BUTTON_REPORT_ID,
				0x10,0x10,0x10,0x10,0x10,
				0x10,0x10,0x10,0x10,0x10,
				0x10,0x10,0x10,0x10,0x10,
				0x10,0x10,0x10,0x10,0x10, 0x10,
				SYSEX_END	}

BUTTONINIT = BUTTON_MSG

KEYBED_MSG = {	0xF0,
				0x00,0x21,0x09,
				0x13,KONTROL_SERIES,0x4D,0x50, 0x00,0x01,
				KEYBED_REPORT_ID,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10, 0x10,0x10,0x10,
				0x10, 0x10, 0x10,
				SYSEX_END	}

KEYBEDINIT = KEYBED_MSG

TOPLBL_MSG = {	0xF0,
				0x00,0x21,0x09,
				0x13,KONTROL_SERIES,0x4D,0x50, 0x00,0x01,
				TOP_LABEL_REPORT_ID,
				string.crunch('M', 8), 0x00,
				string.crunch('A', 8), 0x00,
				string.crunch('I', 8), 0x00,
				string.crunch('N', 8), 0x00,
				string.crunch('S', 8), 0x00,
				string.crunch('T', 8), 0x00,
				string.crunch('A', 8), 0x00,
				string.crunch('G', 8), 0x00,
				string.crunch('E', 8), 0x00,
				SYSEX_END	}

TOPLBLINIT = TOPLBL_MSG

BOTLBL_MSG = {	0xF0,
				0x00,0x21,0x09,
				0x13,KONTROL_SERIES,0x4D,0x50, 0x00,0x01,
				BOT_LABEL_REPORT_ID,
				string.crunch(' ', 8), 0x00,
				string.crunch(' ', 8), 0x00,
				string.crunch(' ', 8), 0x00,
				string.crunch(' ', 8), 0x00,
				string.crunch(' ', 8), 0x00,
				string.crunch(' ', 8), 0x00,
				string.crunch(' ', 8), 0x00,
				string.crunch(' ', 8), 0x00,
				string.crunch(' ', 8), 0x00,
				SYSEX_END	}

TOPLBLINIT = BOTLBL_MSG

BARS_MSG = {	0xF0,
				0x00,0x21,0x09,
				0x13,KONTROL_SERIES,0x4D,0x50, 0x00,0x01,
				BARS_REPORT_ID,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01, 0x00,
				SYSEX_END	}

BARSINIT = BARS_MSG

LAST_CONCERT = nil
LAST_PATCH = nil

LAST_KEYBOARD_VALUES = {}
KEYBOARD_VALUES = {}

OCTAVE_OFFSET = 36

insideSetup = false

-- INITIALIZE CONTROLLER
function controller_initialize(applicationName,deviceNewlyDetected)
	settriggertimer(1000) -- call back in 1000ms
	if deviceNewlyDetected then
		return { midi = { -2000, BUTTON_MSG, KEYBED_MSG, TOPLBL_MSG, BOTLBL_MSG, BARS_MSG } }
	else
		return { midi = { BUTTON_MSG, KEYBED_MSG, TOPLBL_MSG, BOTLBL_MSG, BARS_MSG } }
	end
end

-- FINALIZE CONTROLLER
function controller_finalize()
	return { midi = { BUTTONINIT, KEYBEDINIT, TOPLBLINIT, BUTTONINIT, BARSINIT } }
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch(programchangeNumber,patchname,setname,concertname)
	insideSetup = true
	if LAST_PATCH ~= patchname or LAST_CONCERT ~= concertname then
		LAST_PATCH = patchname
		LAST_CONCERT = concertname
		TOPLBL_MSG[12] = string.crunch(concertname, 8)
		BOTLBL_MSG[12] = string.crunch(patchname, 8)
		no_bar()
		return { midi = { TOPLBL_MSG, BOTLBL_MSG, BARS_MSG } }
	else
		LAST_PATCH = patchname
		LAST_CONCERT = concertname
	end
end

-- Every MIDI event from this device is filtered through this function
function controller_timer_trigger()
	return {midi={KEYBED_MSG, TOPLBL_MSG, BOTLBL_MSG, BARS_MSG}}
end

labelTransTable = {[0x10]=14, [0x11]=16, [0x12]=18, [0x13]=20, [0x14]=22, [0x15]=24, [0x16]=26, [0x17]=28}
barsTransTable  = {[0x10]=22, [0x11]=32, [0x12]=42, [0x13]=52, [0x14]=62, [0x15]=72, [0x16]=82, [0x17]=92}

function no_bar()
	for i=0,8 do
		BARS_MSG[12+i] = 0x00
	end
	BARS_MSG[21] = 0x00
end

function make_bar(index,barLength,unmapped)
	for i = 0, 8 do
		if i >= barLength then
			BARS_MSG[index+i] = 0x00
		else
			BARS_MSG[index+i] = 0x01
		end
	end
	if unmapped == true then
		BARS_MSG[index+9] = 0x00
	else
		BARS_MSG[index+9] = 0x01
	end
end

-- Every MIDI event from this device that is an assignment is filtered through this function
function controller_midi_out(midiEvent,name,valueString,color)
	if midiEvent[0] == 0xF0 or midiEvent[0] == 0xF7 then
		return nil
	elseif midiEvent[0] == 0xB0 then
		receivedEvents = true
		if midiEvent[1] >= 0x10 and midiEvent[1] <= 0x17 then
			if name == 'Unmapped' then
				TOPLBL_MSG[labelTransTable[midiEvent[1]]] = string.crunch(' ', 8)
				BOTLBL_MSG[labelTransTable[midiEvent[1]]] = string.crunch(' ', 8)
				make_bar(barsTransTable[midiEvent[1]], 0, true)
			else
				TOPLBL_MSG[labelTransTable[midiEvent[1]]] = string.crunch(name, 8)
				if valueString ~= nil then
					BOTLBL_MSG[labelTransTable[midiEvent[1]]] = string.crunch(valueString, 8)
				else
					BOTLBL_MSG[labelTransTable[midiEvent[1]]] = string.crunch(string.format("%3d", midiEvent[2]), 8)
				end
				barLength = math.ceil(midiEvent[2] / 15)
				make_bar(barsTransTable[midiEvent[1]], barLength, false)
			end
			settriggertimer(20) -- call back in 1000ms
		end
	end
end

function compare_keys(t1, t2)
	if #t1 ~= #t2 then
		return true
	else
		for i=1,#t1 do
			for j=1,#t1[i] do
				if t1[i][j] ~= t2[i][j] then
					return true
				end
			end
		end
	end
end

function update_keys()
	count = 11
	for i=1,61 do
		for j = 1, 3 do
			count = count + 1
			index = i + OCTAVE_OFFSET
			if index >= 127 then index = 127 end
			KEYBED_MSG[count] = KEYBOARD_VALUES[index][j]
		end
	end
end

function update_layer(layerIndex,maxLayerIndex,minNote,maxNote,color,layerName)
	if insideSetup then
		if color ~= nil then
			for i = minNote, maxNote do
				KEYBOARD_VALUES[i+1] = { math.floor(color.r * 127), math.floor(color.g * 127), math.floor(color.b * 127) }
			end
			if LAST_KEYBOARD_VALUES ~= nil and compare_keys(LAST_KEYBOARD_VALUES, KEYBOARD_VALUES) then
				update_keys()
				return { midi = { KEYBED_MSG } }
			end
			LAST_KEYBOARD_VALUES = KEYBOARD_VALUES
		end
	end
end

-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	-- Transpose Control
	if midiEvent[0] == 0xF0 and midiEvent[1] == 0x00
		and midiEvent[2] == 0x21 and midiEvent[3] == 0x09
		and midiEvent[4] == 0x13 and midiEvent[5] == 0x60
		and midiEvent[6] == 0x4D and midiEvent[7] == 0x50
		and midiEvent[8] == 0x00 and midiEvent[9] == 0x01
		and midiEvent[10] == 0x01 and midiEvent[11] == 0x00 then
		OCTAVE_OFFSET = midiEvent[12]
		update_keys()
		settriggertimer(100)
	end
	return nil
end

function controller_info()
	return {
		-- model name for this device
		model = 'KOMPLETE KONTROL S61',
		-- manufacturer name for this device
		manufacturer = 'Native Instruments',

		-- Do not load into Logic, because <rdar://problem/26916745> LUA device NI KK S-61: Script should be excluded for Logic and GarageBand or entirely removed
		garageband = false,
		logicprox = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items =  {
			-- Patch/Set Buttons
			{name='Arrow LEFT',  label='Arrow LEFT',   objectType='Button', midiType='Momentary', midi={0xB0,0x60,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Arrow RIGHT', label='Arrow RIGHT',  objectType='Button', midiType='Momentary', midi={0xB0,0x63,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Arrow UP',    label='Arrow UP',     objectType='Button', midiType='Momentary', midi={0xB0,0x61,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Arrow DOWN',  label='Arrow DOWN',   objectType='Button', midiType='Momentary', midi={0xB0,0x62,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			-- Volume
			{name='Volume', label='K8', objectType='Knob', midiType='RelativeSM', midi={0xB0,0x17,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			-- Kontrol Knobs
			{name='Knob 1', label='K1', objectType='Knob', midiType='RelativeSM', midi={0xB0,0x10,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Knob 2', label='K2', objectType='Knob', midiType='RelativeSM', midi={0xB0,0x11,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Knob 3', label='K3', objectType='Knob', midiType='RelativeSM', midi={0xB0,0x12,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Knob 4', label='K4', objectType='Knob', midiType='RelativeSM', midi={0xB0,0x13,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Knob 5', label='K5', objectType='Knob', midiType='RelativeSM', midi={0xB0,0x14,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Knob 6', label='K6', objectType='Knob', midiType='RelativeSM', midi={0xB0,0x15,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			{name='Knob 7', label='K7', objectType='Knob', midiType='RelativeSM', midi={0xB0,0x16,MIDI_LSB}, inport='DAWControlPortOut', outport='DAWControlPortIn'},
			-- Perform Buttons
			{name='Shift', label='Shift', objectType='Button', midiType='Momentary', midi={0xB0,0x18,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='Scale', label='Scale', objectType='Button', midiType='Momentary', midi={0xB0,0x19,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='Arp',   label='Arp',   objectType='Button', midiType='Momentary', midi={0xB0,0x1A,MIDI_LSB}, inport='DAWControlPortOut'},
			-- Perform Buttons Row 1
			{name='Loop',  label='Loop',  objectType='Button', midiType='Momentary', midi={0xB0,0x1B,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='RWD',   label='RWD',   objectType='Button', midiType='Momentary', midi={0xB0,0x1C,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='FFW',   label='FFW',   objectType='Button', midiType='Momentary', midi={0xB0,0x1D,MIDI_LSB}, inport='DAWControlPortOut'},
			-- Perform Buttons Row 2
			{name='PLAY',  label='PLAY',  objectType='Button', midiType='Momentary', midi={0xB0,0x1E,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='REC',   label='REC',   objectType='Button', midiType='Momentary', midi={0xB0,0x1F,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='STOP',  label='STOP',  objectType='Button', midiType='Momentary', midi={0xB0,0x20,MIDI_LSB}, inport='DAWControlPortOut'},
			-- Shift Knobs
			{name='<',     label='<',     objectType='Button', midiType='Momentary', midi={0xB0,0x28,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='>',     label='>',     objectType='Button', midiType='Momentary', midi={0xB0,0x29,MIDI_LSB}, inport='DAWControlPortOut'},
			-- Navigate
			{name='Browse',   label='Browse',   objectType='Button', midiType='Momentary', midi={0xB0,0x21,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='Instance', label='Instance', objectType='Button', midiType='Momentary', midi={0xB0,0x22,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='Back',     label='Back',     objectType='Button', midiType='Momentary', midi={0xB0,0x23,MIDI_LSB}, inport='DAWControlPortOut'},
			-- Big Knob
			{name='Big Knob', label='Navigate', objectType='Knob', midiType='Relative', midi={0xB0,0x64,MIDI_LSB}, inport='DAWControlPortOut'},
			-- Preset
			{name='PRESET UP',   label='PRESET UP',   objectType='Button', midiType='Momentary', midi={0xB0,0x42,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='PRESET DOWN', label='PRESET DOWN', objectType='Button', midiType='Momentary', midi={0xB0,0x42,MIDI_LSB}, inport='DAWControlPortOut'},
			{name='Enter',       label='Enter',       objectType='Button', midiType='Momentary', midi={0xB0,0x42,MIDI_LSB}, inport='DAWControlPortOut'}
		}
	}
end
