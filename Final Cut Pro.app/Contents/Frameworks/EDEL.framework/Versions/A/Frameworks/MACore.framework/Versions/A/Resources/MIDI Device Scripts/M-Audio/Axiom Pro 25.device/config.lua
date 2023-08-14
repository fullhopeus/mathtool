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

-- Every MIDI event from this device that is an assignment is filtered through this function
function controller_midi_out(midiEvent,name,valueString,color)
	--print(midiEvent[0],midiEvent[1],midiEvent[2],name,valueString,color)
	if midiEvent[0] == 0xBF then

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

	return {midi={	0xf0,0x00,0x01,0x05,0x20,0x7F,0x11, 0x01, 0x00, 0x00, 0x00, 0xf7,
					0xf0,0x00,0x01,0x05,0x20,0x7F,0x11, 0x01, 0x00, 0x00, string.crunch(patchname, 18), 0xf7,
					0xf0,0x00,0x01,0x05,0x20,0x7F,0x11, 0x03, 0x00, 0x00, programNumberStr,
														0x00, 0x01, 0x00, string.crunch(setname, 21),
														0x00, 0x02, 0x00, string.crunch(concertname, 21), 0xf7,}, outport='HyperControl Out'}
end

-- Return the list of valid controllers
function controller_names(channel)
	if channel == 15 then
		return {
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

				[0x71] = 'LOOP',  
				[0x72] = 'REWIND',
				[0x73] = 'FORWARD',
				[0x74] = 'STOP',  
				[0x75] = 'PLAY',  
				[0x76] = 'RECORD',

				[0x6D] = 'Button F1', 
				[0x6E] = 'Button F2', 
				[0x6F] = 'Button F3', 
				[0x0C] = 'Button F4', 
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
		model = 'Axiom Pro 25',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Keyboard', label='Axiom Pro 25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}, inport='Axiom Pro USB A In'},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}, inport='Axiom Pro USB A In'},

				{name='Knob 8', label='Volume', objectType='Knob', midiType='Relative2C', midi={0xBF,0x18,MIDI_LSB}, inport='HyperControl In'},

				{name='Knob 1', label='B5', objectType='Knob', midiType='Relative2C', midi={0xBF,0x11,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 2', label='B6', objectType='Knob', midiType='Relative2C', midi={0xBF,0x12,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 3', label='B7', objectType='Knob', midiType='Relative2C', midi={0xBF,0x13,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 4', label='B8', objectType='Knob', midiType='Relative2C', midi={0xBF,0x14,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 5', label='B1', objectType='Knob', midiType='Relative2C', midi={0xBF,0x15,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 6', label='B2', objectType='Knob', midiType='Relative2C', midi={0xBF,0x16,MIDI_LSB}, inport='HyperControl In'},
				{name='Knob 7', label='B3', objectType='Knob', midiType='Relative2C', midi={0xBF,0x17,MIDI_LSB}, inport='HyperControl In'},
                                                                                                         
				{name='Soft-Key 1', label='S10', objectType='Button', midiType='Momentary', midi={0xBF,0x4A,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Soft-Key 2', label='S11', objectType='Button', midiType='Momentary', midi={0xBF,0x4B,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Soft-Key 3', label='S12', objectType='Button', midiType='Momentary', midi={0xBF,0x4C,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},
				{name='Soft-Key 4', label='S13', objectType='Button', midiType='Momentary', midi={0xBF,0x4D,MIDI_LSB}, inport='HyperControl In', outport='HyperControl Out'},

				{name='Button F1', label='F1', objectType='Button', midiType='Momentary', midi={0xBF,0x6D,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F2', label='F2', objectType='Button', midiType='Momentary', midi={0xBF,0x6E,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F3', label='F3', objectType='Button', midiType='Momentary', midi={0xBF,0x6F,MIDI_LSB}, inport='HyperControl In'},
				{name='Button F4', label='F4', objectType='Button', midiType='Momentary', midi={0xBF,0x0C,MIDI_LSB}, inport='HyperControl In'},

				{name='LOOP',                  objectType='Button', midiType='Momentary', midi={0xBF,0x71,MIDI_LSB}, inport='HyperControl In'},
				{name='REWIND',                objectType='Button', midiType='Momentary', midi={0xBF,0x72,MIDI_LSB}, inport='HyperControl In'},
				{name='FORWARD',               objectType='Button', midiType='Momentary', midi={0xBF,0x73,MIDI_LSB}, inport='HyperControl In'},
				{name='STOP',                  objectType='Button', midiType='Momentary', midi={0xBF,0x74,MIDI_LSB}, inport='HyperControl In'},
				{name='PLAY',                  objectType='Button', midiType='Momentary', midi={0xBF,0x75,MIDI_LSB}, inport='HyperControl In'},
				{name='RECORD',                objectType='Button', midiType='Momentary', midi={0xBF,0x76,MIDI_LSB}, inport='HyperControl In'},

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
