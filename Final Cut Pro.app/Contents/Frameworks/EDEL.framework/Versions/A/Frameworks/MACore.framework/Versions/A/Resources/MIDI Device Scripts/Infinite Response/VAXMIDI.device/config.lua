savedEvent = {}

-- MainStage is listening to MIDI Bank Select MSB/LSB on channel 16, with MSB being an
-- index to the set that should be selected and LSB being the patch inside this set.
-- This MIDI message is currently hard-coded in the app!

-- Every MIDI event from this device is filtered through this function
function controller_timer_trigger()
	return {midi = savedEvent}
end

-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if midiEvent[0] == 0xF0 and midiEvent[1] == 0x00 and midiEvent[2] == 0x01 and midiEvent[3] == 0x58 and midiEvent[4] == 0x03 and midiEvent[5] == 0xF7 then
		settriggertimer(100)		-- call back in 100ms
		return {midi={}}
	elseif midiEvent[0] == 0xC0 then
		return {midi={}}	-- always ignore program change for this keyboard
	end
	return nil	-- allow all other events
end

-- Return MIDI event stream that configures the device to be used, this will be called _every_ time
-- when the app is launched or the device is connected.
function controller_initialize(applicationName,deviceNewlyDetected)
	settriggertimer(10)		-- call back in 10ms (prime the timer for the first time!)
	return {midi={0xf0,0x00,0x01,0x58,0x02,  0x00,0x00,0x00,0x00,0x00,"MainStage", 0x00, 
											 0xf7}}
end

-- Return MIDI event stream that finializes the device after usage, this will be called _every_ time
-- when the app is terminated.
function controller_finalize()
	return {midi={0xf0,0x00,0x01,0x58,0x02,  0x00,0x00,0x00,0x00,0x00,"Waiting for Host", 0x00, 
											 0xf7}}
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch(programchangeNumber, patchname, setname, concertname, patchlist, currentSetIndex, currentPatchIndex)

	-- base of the event with a "concert" name on the top
	event = { 0xf0,0x00,0x01,0x58,0x02, 0x00,0x00,0x00,0x00,0x00,concertname, 0x00  }

	for I=1, #patchlist do
		-- a patch or a set
		if patchlist[I].IsPatch then
			table.insert(event, 0x02)
		else
			table.insert(event, 0x01)
		end

		-- program change number
		table.insert(event, 0x7F)

		-- bank select MSB
		if patchlist[I].PatchIndex >= 0 then
			table.insert(event, patchlist[I].PatchIndex)
		else
			table.insert(event, 0x7F)
		end

		-- bank select LSB
		if patchlist[I].SetIndex >= 0 then
			table.insert(event, patchlist[I].SetIndex)
		else
			table.insert(event, 0x7F)
		end

		-- MIDI channel 1
		table.insert(event, 0x00)

		-- 0-terminated string with the name
		table.insert(event, patchlist[I].Label)
		table.insert(event, 0x00)
	end

	table.insert(event, 0xF7)

	-- only send the SysEx, if it actually changed, otherwise the VAX77 will do a lot of redraws
	if #savedEvent == #event then
		sysexAreEqual = true
		for I=1, #savedEvent do
			if savedEvent[I] ~= event[I] then
				sysexAreEqual = false
			end
		end
	else
		sysexAreEqual = false
	end
	if sysexAreEqual then
		event = {}
	else
		savedEvent = event
	end

	sendEvent = { event }
	if sysexAreEqual == false then
		table.insert(sendEvent, -100)		-- 100ms delay to avoid that CoreMIDI interleaves the Bank Select events with the SysEx
	end
	table.insert(sendEvent, 0xB0)
	table.insert(sendEvent, 0x20)
	table.insert(sendEvent, currentPatchIndex)
	table.insert(sendEvent, 0xB0)
	table.insert(sendEvent, 0x00)
	table.insert(sendEvent, currentSetIndex)
	table.insert(sendEvent, 0xC0)
	table.insert(sendEvent, 0x7F)
	return {midi=sendEvent}
end

-- Return the list of valid controllers
function controller_names(channel)
	if channel == 0 then
		return {
				[0x01] = 'Modulation',
				[0x07] = 'Left Wheel',
				[0x09] = 'Black Key',

				[0x40] = 'Sustain Pedal',
				[0x04] = 'Pedal A',
				[0x0B] = 'Pedal B',
				[0x0C] = 'Pedal C',

				[0x46] = 'Slider 1',
				[0x47] = 'Slider 2',
				[0x48] = 'Slider 3',
				[0x49] = 'Slider 4',
				[0x4A] = 'Slider 5',
				[0x4B] = 'Slider 6',
				[0x4C] = 'Slider 7',
				[0x4D] = 'Slider 8',
				[0x4E] = 'Slider 9',
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
		model = 'VAXMIDI',
		-- manufacturer name for this device
		manufacturer = 'Infinite Response',

		-- we send Bank Select LSB/MSB to select a certain patch inside a set
		patchselector = true,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Keyboard', label='VAX77', objectType='Keyboard', midiType='Keyboard', startKey=21, numberKeys=77, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},
				{name='Left Wheel', objectType='Volume', midi={0xB0,0x07,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Pedal B', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},	-- Pedal B comes first, because our concerts use Expression as the first pedal
				{name='Pedal A', objectType='Pedal', midi={0xB0,0x04,MIDI_LSB}},
				{name='Pedal C', objectType='Pedal', midi={0xB0,0x0C,MIDI_LSB}},
				
				{name='Slider 9', objectType='VFader', midi={0xB0,0x4E,MIDI_LSB}, outport=''},
				
				{name='Slider 1', objectType='VFader', midi={0xB0,0x46,MIDI_LSB}, outport=''},
				{name='Slider 2', objectType='VFader', midi={0xB0,0x47,MIDI_LSB}, outport=''},
				{name='Slider 3', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}, outport=''},
				{name='Slider 4', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}, outport=''},
				{name='Slider 5', objectType='VFader', midi={0xB0,0x4A,MIDI_LSB}, outport=''},
				{name='Slider 6', objectType='VFader', midi={0xB0,0x4B,MIDI_LSB}, outport=''},
				{name='Slider 7', objectType='VFader', midi={0xB0,0x4C,MIDI_LSB}, outport=''},
				{name='Slider 8', objectType='VFader', midi={0xB0,0x4D,MIDI_LSB}, outport=''},

				{name='Black Key', objectType='VFader', midi={0xB0,0x09,MIDI_LSB}},
			}
		}
end
