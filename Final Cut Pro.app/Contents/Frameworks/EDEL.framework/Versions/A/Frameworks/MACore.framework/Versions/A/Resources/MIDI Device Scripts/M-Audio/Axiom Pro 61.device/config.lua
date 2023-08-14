appName = ''

-- Return MIDI event stream that configures the device to be used, this will be called _every_ time
-- when the app is launched or the device is connected.
function controller_initialize(applicationName,deviceNewlyDetected)
	appName = applicationName
	if deviceNewlyDetected then
		return {midi={ -2000,
					   0xf0,0x00,0x01,0x05,0x20,0x7F,0x20,0x2A,0xf7,
					   0xf0,0x00,0x01,0x05,0x20,0x7F,0x10,0xf7,
					   0xf0,0x00,0x01,0x05,0x20,0x7F,0x11,0x03,0x01,0x01, 'Welcome to ' .. appName, 0xf7,
					 }, outport='HyperControl Out'}
	else
		return {midi={ 0xf0,0x00,0x01,0x05,0x20,0x7F,0x20,0x2A,0xf7,
					   0xf0,0x00,0x01,0x05,0x20,0x7F,0x10,0xf7,
					   0xf0,0x00,0x01,0x05,0x20,0x7F,0x11,0x03,0x01,0x01, 'Welcome to ' .. appName, 0xf7,
					 }, outport='HyperControl Out'}
	end
end

-- Return MIDI event stream that finializes the device after usage, this will be called _every_ time
-- when the app is terminated.
function controller_finalize()
	return {midi={  0xf0,0x00,0x01,0x05,0x20,0x7F,0x11,0x01,0x00,0x00,'        ',0xf7,
					0xf0,0x00,0x01,0x05,0x20,0x7F,0x11,0x01,0x00,0x0a,'        ',0xf7,
				    0xf0,0x00,0x01,0x05,0x20,0x7F,0x10,0xf7,
				    0xf0,0x00,0x01,0x05,0x20,0x7F,0x11,0x03,0x01,0x03, appName .. ' closed', 0xf7,
				    0xf0,0x00,0x01,0x05,0x20,0x7F,0x20,0x00,0xf7,
				 }, outport='HyperControl Out'}
end

updateObjectsAfterPatchChange = {}

-- Every MIDI event from this device that is an assignment is filtered through this function
function controller_midi_out(midiEvent,name,valueString,color)
	--print(midiEvent[0],midiEvent[1],midiEvent[2],name,valueString,color)
	if midiEvent[0] == 0xBF then

		-- remove already updated LEDs from the table
		updateObjectsAfterPatchChange[midiEvent[1]] = nil

		if midiEvent[1] >= 0x4A and midiEvent[1] <= 0x4D and name ~= nil then		-- the soft buttons
			return {midi={0xf0,0x00,0x01,0x05,0x20,0x7F,0x11, 0x04, midiEvent[1]-0x4A, 0x00, string.crunch(name, 5), 0xf7,
						  0xB0,midiEvent[1],midiEvent[2]}, outport='HyperControl Out'}
		end
	end
	return nil
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch(programchangeNumber, patchname, setname, concertname)
	if programchangeNumber >= 0 then
		programNumberStr = 'Program #' .. programchangeNumber
	else
		programNumberStr = 'Program #---'
	end

	-- turn the LED light off
	updateObjectsAfterPatchChange[0x31] = {midi={0xBF,0x31,0x00}}	
	updateObjectsAfterPatchChange[0x32] = {midi={0xBF,0x32,0x00}}	
	updateObjectsAfterPatchChange[0x33] = {midi={0xBF,0x33,0x00}}	
	updateObjectsAfterPatchChange[0x34] = {midi={0xBF,0x34,0x00}}	
	updateObjectsAfterPatchChange[0x35] = {midi={0xBF,0x35,0x00}}	
	updateObjectsAfterPatchChange[0x36] = {midi={0xBF,0x36,0x00}}	
	updateObjectsAfterPatchChange[0x37] = {midi={0xBF,0x37,0x00}}	
	updateObjectsAfterPatchChange[0x38] = {midi={0xBF,0x38,0x00}}	
	updateObjectsAfterPatchChange[0x39] = {midi={0xBF,0x39,0x00}}	

	return {midi={	0xf0,0x00,0x01,0x05,0x20,0x7F,0x11, 0x01, 0x00, 0x00, 0x00, 0xf7,
					0xf0,0x00,0x01,0x05,0x20,0x7F,0x11, 0x01, 0x00, 0x00, string.crunch(patchname, 18), 0xf7,
					0xf0,0x00,0x01,0x05,0x20,0x7F,0x11, 0x03, 0x00, 0x00, programNumberStr,
														0x00, 0x01, 0x00, string.crunch(setname, 21),
														0x00, 0x02, 0x00, string.crunch(concertname, 21), 0xf7,}, outport='HyperControl Out'}
end

-- Return MIDI event stream that configures the device for the next patch to be used
function controller_select_patch_done(programchangeNumber, patchname, setname, concertname)
	return updateObjectsAfterPatchChange
end

-- Return the list of valid controllers
function controller_names(channel)
	if channel == 15 then
		return {
				[0x21] = 'Fader 1',
				[0x22] = 'Fader 2',
				[0x23] = 'Fader 3',
				[0x24] = 'Fader 4',
				[0x25] = 'Fader 5',
				[0x26] = 'Fader 6',
				[0x27] = 'Fader 7',
				[0x28] = 'Fader 8',
				[0x29] = 'Fader 9',

				[0x11] = 'Knob 1', 
				[0x12] = 'Knob 2', 
				[0x13] = 'Knob 3', 
				[0x14] = 'Knob 4', 
				[0x15] = 'Knob 5', 
				[0x16] = 'Knob 6', 
				[0x17] = 'Knob 7', 
				[0x18] = 'Knob 8', 

				[0x4A] = 'Soft-Key 1',
				[0x4B] = 'Soft-Key 2',
				[0x4C] = 'Soft-Key 3',
				[0x4D] = 'Soft-Key 4',

				[0x6D] = 'Button F1', 
				[0x6E] = 'Button F2', 
				[0x6F] = 'Button F3', 
				[0x0C] = 'Button F4', 
				[0x0D] = 'Button F5', 
				[0x0E] = 'Button F6', 
				[0x0F] = 'Button F7', 

				[0x31] = 'Button 1', 
				[0x32] = 'Button 2', 
				[0x33] = 'Button 3', 
				[0x34] = 'Button 4', 
				[0x35] = 'Button N', 
				[0x36] = 'Button S', 
				[0x37] = 'Button E', 
				[0x38] = 'Button P', 
				[0x39] = 'Button -', 

				[0x71] = 'LOOP',  
				[0x72] = 'REWIND',
				[0x73] = 'FORWARD',
				[0x74] = 'STOP',  
				[0x75] = 'PLAY',  
				[0x76] = 'RECORD',
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
		model = 'Axiom Pro 61',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Keyboard', label='Axiom Pro 61', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=61, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}, inport='Axiom Pro USB A In'},

				{name='Fader 9', label='Volume', objectType='VFader', midi={0xBF,0x29,MIDI_LSB}, inport='HyperControl In'},

				{name='Fader 1', label='D9',  objectType='VFader', midi={0xBF,0x21,MIDI_LSB}, inport='HyperControl In'},
				{name='Fader 2', label='D10', objectType='VFader', midi={0xBF,0x22,MIDI_LSB}, inport='HyperControl In'},
				{name='Fader 3', label='D11', objectType='VFader', midi={0xBF,0x23,MIDI_LSB}, inport='HyperControl In'},
				{name='Fader 4', label='D12', objectType='VFader', midi={0xBF,0x24,MIDI_LSB}, inport='HyperControl In'},
				{name='Fader 5', label='D13', objectType='VFader', midi={0xBF,0x25,MIDI_LSB}, inport='HyperControl In'},
				{name='Fader 6', label='D14', objectType='VFader', midi={0xBF,0x26,MIDI_LSB}, inport='HyperControl In'},
				{name='Fader 7', label='D15', objectType='VFader', midi={0xBF,0x27,MIDI_LSB}, inport='HyperControl In'},
				{name='Fader 8', label='D16', objectType='VFader', midi={0xBF,0x28,MIDI_LSB}, inport='HyperControl In'},

				{name='Knob 1', label='B5', objectType='Knob', midiType='Relative2C', midi={0xBF,0x11,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 2', label='B6', objectType='Knob', midiType='Relative2C', midi={0xBF,0x12,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 3', label='B7', objectType='Knob', midiType='Relative2C', midi={0xBF,0x13,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 4', label='B8', objectType='Knob', midiType='Relative2C', midi={0xBF,0x14,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 5', label='B1', objectType='Knob', midiType='Relative2C', midi={0xBF,0x15,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 6', label='B2', objectType='Knob', midiType='Relative2C', midi={0xBF,0x16,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 7', label='B3', objectType='Knob', midiType='Relative2C', midi={0xBF,0x17,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 8', label='B4', objectType='Knob', midiType='Relative2C', midi={0xBF,0x18,MIDI_LSB}, inport='HyperControl In'},
                                                                                                         
				{name='Soft-Key 1', label='S10', objectType='Button', midiType='Momentary', midi={0xBF,0x4A,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Soft-Key 2', label='S11', objectType='Button', midiType='Momentary', midi={0xBF,0x4B,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Soft-Key 3', label='S12', objectType='Button', midiType='Momentary', midi={0xBF,0x4C,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Soft-Key 4', label='S13', objectType='Button', midiType='Momentary', midi={0xBF,0x4D,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},

				{name='Button F1', label='F1', objectType='Button', midiType='Momentary', midi={0xBF,0x6D,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F2', label='F2', objectType='Button', midiType='Momentary', midi={0xBF,0x6E,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F3', label='F3', objectType='Button', midiType='Momentary', midi={0xBF,0x6F,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F4', label='F4', objectType='Button', midiType='Momentary', midi={0xBF,0x0C,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F5', label='F5', objectType='Button', midiType='Momentary', midi={0xBF,0x0D,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F6', label='F6', objectType='Button', midiType='Momentary', midi={0xBF,0x0E,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F7', label='F7', objectType='Button', midiType='Momentary', midi={0xBF,0x0F,MIDI_LSB}, inport='HyperControl In'},

				{name='Button 1', label='S10', objectType='Button', midiType='Momentary', midi={0xBF,0x31,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Button 2', label='S11', objectType='Button', midiType='Momentary', midi={0xBF,0x32,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Button 3', label='S12', objectType='Button', midiType='Momentary', midi={0xBF,0x33,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Button 4', label='S13', objectType='Button', midiType='Momentary', midi={0xBF,0x34,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Button N', label='S14', objectType='Button', midiType='Momentary', midi={0xBF,0x35,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Button S', label='S15', objectType='Button', midiType='Momentary', midi={0xBF,0x36,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Button E', label='S16', objectType='Button', midiType='Momentary', midi={0xBF,0x37,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Button P', label='S17', objectType='Button', midiType='Momentary', midi={0xBF,0x38,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Button -', label='S18', objectType='Button', midiType='Momentary', midi={0xBF,0x39,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},

				{name='LOOP',                  objectType='Button', midiType='Momentary', midi={0xB0,0x71,MIDI_LSB}, inport='HyperControl In'},
				{name='REWIND',                objectType='Button', midiType='Momentary', midi={0xB0,0x72,MIDI_LSB}, inport='HyperControl In'},
				{name='FORWARD',               objectType='Button', midiType='Momentary', midi={0xB0,0x73,MIDI_LSB}, inport='HyperControl In'},
				{name='STOP',                  objectType='Button', midiType='Momentary', midi={0xB0,0x74,MIDI_LSB}, inport='HyperControl In'},
				{name='PLAY',                  objectType='Button', midiType='Momentary', midi={0xB0,0x75,MIDI_LSB}, inport='HyperControl In'},
				{name='RECORD',                objectType='Button', midiType='Momentary', midi={0xB0,0x76,MIDI_LSB}, inport='HyperControl In'},

				{name='Pad 1', label='P5', objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Pad 2', label='P6', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Pad 3', label='P7', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Pad 4', label='P8', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Pad 5', label='P1', objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Pad 6', label='P2', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Pad 7', label='P3', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Pad 8', label='P4', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}, inport='Axiom Pro USB A In'},
			}
		}
end
