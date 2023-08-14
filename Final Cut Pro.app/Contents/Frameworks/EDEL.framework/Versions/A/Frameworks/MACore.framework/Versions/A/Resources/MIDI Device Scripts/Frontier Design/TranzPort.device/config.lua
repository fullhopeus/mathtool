-- Return MIDI event stream that configures the device to be used, this will be called _every_ time
-- when the app is launched or the device is connected.
function controller_initialize(applicationName)
	return {midi={0xf0,0x00,0x01,0x40,0x10,0x01,0x00,0xf7,
				  0xf0,0x00,0x01,0x40,0x10,0x00,0,string.crunch(applicationName,40),0xf7}}
end

-- Return MIDI event stream that finializes the device after usage, this will be called _every_ time
-- when the app is terminated.
function controller_finalize()
	return {{midi={0x90,0x5f,0x00}},	-- Record Transport LED
			{midi={0x90,0x00,0x00}},	-- Record Arm LED
			{midi={0x90,0x10,0x00}},	-- Mute LED
			{midi={0x90,0x08,0x00}},	-- Solo LED
			{midi={0x90,0x73,0x00}},	-- Any LED
			{midi={0x90,0x78,0x00}},	-- Punch LED
			{midi={0x90,0x56,0x00}},	-- Loop LED
			{midi={0xf0,0x00,0x01,0x40,0x10,0x00,0,string.crunch('',40),0xf7}},	-- clear the display
		}

end

updateObjectsAfterPatchChange = {}

-- Every MIDI event from this device that is an assignment is filtered through this function
function controller_midi_out(midiEvent,name,valueString,color)
	if midiEvent[0] == 0x90 then
		-- remove already updated LEDs from the table
		updateObjectsAfterPatchChange[midiEvent[1]] = nil
	end
	return nil	-- filter nothing, we don't change MIDI events
end


-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch(programchangeNumber, patchname, setname, concertname)
	if programchangeNumber < 0 then
		str = "--- "
	else
		str = string.format("%3d ", programchangeNumber)
	end
	str = str .. string.crunch(patchname, 16)
	str = str .. string.crunch(setname, 20)

	-- turn the LED light off
	updateObjectsAfterPatchChange[0x5F] = {midi={0x90,0x5f,0x00}}	-- Record Transport LED
	updateObjectsAfterPatchChange[0x00] = {midi={0x90,0x00,0x00}}	-- Record Arm LED
	updateObjectsAfterPatchChange[0x10] = {midi={0x90,0x10,0x00}}	-- Mute LED
	updateObjectsAfterPatchChange[0x08] = {midi={0x90,0x08,0x00}}	-- Solo LED
	updateObjectsAfterPatchChange[0x73] = {midi={0x90,0x73,0x00}}	-- Any LED
	updateObjectsAfterPatchChange[0x78] = {midi={0x90,0x78,0x00}}	-- Punch LED
	updateObjectsAfterPatchChange[0x56] = {midi={0x90,0x56,0x00}}	-- Loop LED

	return {midi={0xf0,0x00,0x01,0x40,0x10,0x00,0, str, 0xf7}}
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch_done(programchangeNumber, patchname, setname, concertname)
	return updateObjectsAfterPatchChange
end

-- Return the list of valid controllers
function controller_names(channel)
	-- Tranzport sends only _one_ controller for the wheel
	if channel == 0 then
		return { [0x3C] = "Data Wheel",
				}
	else
		return {}
	end
end

-- Return the list of valid controllers
function controller_note_names(channel)
	if channel == 0 then
		return { -- Transport
				 [0x5B] = "Rewind",
		  		 [0x5C] = "Fast Forward", 
		  		 [0x5D] = "Stop", 
		  		 [0x5E] = "Play", 
		  		 [0x5F] = "Record", 
		  		 -- Track Controls
				 [0x30] = "Previous Track", 
		  		 [0x31] = "Next Track", 
		  		 [0x00] = "Arm Record", 
		  		 [0x10] = "Mute", 
		  		 [0x08] = "Solo", 
		  		 [0x73] = "Any Solo (LED)", 
		  		 -- Punch / Loop Controls
		  		 [0x57] = "In", 
		  		 [0x58] = "Out", 
		  		 [0x78] = "Punch", 
		  		 [0x56] = "Loop", 
				 -- Marker
		  		 [0x54] = "Previous Marker", 
		  		 [0x52] = "Add Marker", 
		  		 [0x55] = "Next Marker", 
				 -- Micselleaneous
		  		 [0x4C] = "Undo", 
		  		 [0x79] = "Shift", 
		  		 [0x67] = "Footswitch", 
				}
	else
		return {}
	end
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Tranzport',
		-- manufacturer name for this device
		manufacturer = 'Frontier Design',

		-- Special 'Device Inquiry' request
		device_request = {0xf0,0x7e,0x00,0x06,0x01,0xf7},

		-- Response to the 'Device Inquiry' message
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x00,0x01,0x40,0x00,0x00,0x01,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,

		-- don't play notes from this device
		ignore_notes = true,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Prev Track', label='Prev Track', objectType='Button', midiType='Note', midi={0x90,0x30,MIDI_LSB}},
				{name='Next Track', label='Next Track', objectType='Button', midiType='Note', midi={0x90,0x31,MIDI_LSB}},
				{name='Rec', label='Rec', objectType='Button', midiType='Note', midi={0x90,0x00,MIDI_LSB}, outport="TranzPort"},
				{name='Mute', label='Mute', objectType='Button', midiType='Note', midi={0x90,0x10,MIDI_LSB}, outport="TranzPort"},
				{name='Solo', label='Solo', objectType='Button', midiType='Note', midi={0x90,0x08,MIDI_LSB}, outport="TranzPort"},
				{name='Any Solo', label='Any Solo', objectType='None', midiType='Note', midi={0x90,0x73,MIDI_LSB}, outport="TranzPort"},
				{name='Undo', label='Undo', objectType='Button', midiType='Note', midi={0x90,0x4C,MIDI_LSB}, outport="TranzPort"},

				{name='In', label='In', objectType='Button', midiType='Note', midi={0x90,0x57,MIDI_LSB}},
				{name='Out', label='Out', objectType='Button', midiType='Note', midi={0x90,0x58,MIDI_LSB}},
				{name='Punch', label='Punch', objectType='Button', midiType='Note', midi={0x90,0x78,MIDI_LSB}, outport="TranzPort"},
				{name='Loop', label='Loop', objectType='Button', midiType='Note', midi={0x90,0x56,MIDI_LSB}, outport="TranzPort"},

				{name='Shift', label='Shift', objectType='Button', midiType='Note', midi={0x90,0x79,MIDI_LSB}},
				{name='Prev Marker', label='Prev Marker', objectType='Button', midiType='Note', midi={0x90,0x54,MIDI_LSB}},
				{name='Add Marker', label='Add Marker', objectType='Button', midiType='Note', midi={0x90,0x52,MIDI_LSB}},
				{name='Next Marker', label='Next Marker', objectType='Button', midiType='Note', midi={0x90,0x55,MIDI_LSB}},

				{name='Rewind', label='Rewind', objectType='Button', midiType='Note', midi={0x90,0x5B,MIDI_LSB}},
				{name='Forward', label='Forward', objectType='Button', midiType='Note', midi={0x90,0x5C,MIDI_LSB}},
				{name='Stop', label='Stop', objectType='Button', midiType='Note', midi={0x90,0x5D,MIDI_LSB}},
				{name='Play', label='Play', objectType='Button', midiType='Note', midi={0x90,0x5E,MIDI_LSB}},
				{name='Record', label='Record', objectType='Button', midiType='Note', midi={0x90,0x5F,MIDI_LSB}, outport="TranzPort"},

				{name='Wheel', objectType='Wheel', midiType='DirectionAndSpeed', midi={0xB0,0x01,MIDI_LSB}},

				{name='Pedal', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x67,MIDI_LSB}},
			}
		}
end
