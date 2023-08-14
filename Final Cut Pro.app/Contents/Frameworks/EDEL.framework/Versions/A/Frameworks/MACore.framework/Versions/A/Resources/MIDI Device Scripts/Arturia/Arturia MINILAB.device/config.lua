
SysexValues =
{
	-- upper row
	[0x4A] = 1,
	[0x47] = 2,
	[0x4C] = 9,
	[0x4D] = 0x0B,
	[0x5D] = 0x0C,
	[0x49] = 0x0D,
	[0x4B] = 0x0E,
	-- lower row
	[0x12] = 3,
	[0x13] = 4,
	[0x10] = 0x0a,
	[0x11] = 5,
	[0x5B] = 6,
	[0x4F] = 7,
	[0x48] = 8
}

function controller_midi_out(midiEvent,name,valueString,color)
	if midiEvent[0] == 0xB0 then
		receivedEvents = true
		if SysexValues[midiEvent[1]] then
			--print("converting cc to sysex")
			--print(midiEvent[0],midiEvent[1],midiEvent[2],name,valueString,color, SysexValues[midiEvent[1]])
			return {midi={0xf0,0x00,0x20,0x6B,0x7F,0x42,0x02, 0x00, 0x00, SysexValues[midiEvent[1]], midiEvent[2], 0xf7
						 }, outport='MINILAB'}
		else
			--print("not a knob cc")
			--print(midiEvent[0],midiEvent[1],midiEvent[2],name,valueString,color)
		end
	end
	return nil
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Arturia MINILAB',
		-- manufacturer name for this device
		manufacturer = 'Arturia',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'MIDI Preset 1',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='MINILAB', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				
				-- LAST KNOB ALWAYS MASTER VOLUME 
				{name='Knob 16', label='Volume', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				
				-- SET 1
				{name='Knob 1', label='1', objectType='Knob', midi={0xB0,0x70,MIDI_LSB}},
				{name='Knob 2', label='2', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 3', label='3', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 4', label='4', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}, outport='MINILAB'},
				-- SET 2
				{name='Knob 5', label='5', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 6', label='6', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 7', label='7', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 8', label='8', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}, outport='MINILAB'},
				-- SET 3
				{name='Knob 9', label='9', objectType='Knob', midi={0xB0,0x72,MIDI_LSB}},
				{name='Knob 10', label='10', objectType='Knob', midi={0xB0,0x12,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 11', label='11', objectType='Knob', midi={0xB0,0x13,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 12', label='12', objectType='Knob', midi={0xB0,0x10,MIDI_LSB}, outport='MINILAB'},
				-- SET 4
				{name='Knob 13', label='13', objectType='Knob', midi={0xB0,0x11,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 14', label='14', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 15', label='15', objectType='Knob', midi={0xB0,0x4F,MIDI_LSB}, outport='MINILAB'},
				{name='Knob 16', label='16', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}, outport='MINILAB'},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				-- PAD 1-8
				{name='PAD 1', label='1', objectType='Drumpad', midiType='Note', midi={0x89,0x24,MIDI_LSB}},
				{name='PAD 2', label='2', objectType='Drumpad', midiType='Note', midi={0x89,0x25,MIDI_LSB}},
				{name='PAD 3', label='3', objectType='Drumpad', midiType='Note', midi={0x89,0x26,MIDI_LSB}},
				{name='PAD 4', label='4', objectType='Drumpad', midiType='Note', midi={0x89,0x27,MIDI_LSB}},
				{name='PAD 5', label='5', objectType='Drumpad', midiType='Note', midi={0x89,0x28,MIDI_LSB}},
				{name='PAD 6', label='6', objectType='Drumpad', midiType='Note', midi={0x89,0x29,MIDI_LSB}},
				{name='PAD 7', label='7', objectType='Drumpad', midiType='Note', midi={0x89,0x2A,MIDI_LSB}},
				{name='PAD 8', label='8', objectType='Drumpad', midiType='Note', midi={0x89,0x2B,MIDI_LSB}},
				-- PAD 9-16
				{name='PAD 9', label='9', objectType='Drumpad', midiType='Momentary', midi={0xB0,0x16,MIDI_LSB}},
				{name='PAD 10', label='10', objectType='Drumpad', midiType='Momentary', midi={0xB0,0x17,MIDI_LSB}},
				{name='PAD 11', label='11', objectType='Drumpad', midiType='Momentary', midi={0xB0,0x18,MIDI_LSB}},
				{name='PAD 12', label='12', objectType='Drumpad', midiType='Momentary', midi={0xB0,0x19,MIDI_LSB}},
				{name='PAD 13', label='13', objectType='Drumpad', midiType='Momentary', midi={0xB0,0x1A,MIDI_LSB}},
				{name='PAD 14', label='14', objectType='Drumpad', midiType='Momentary', midi={0xB0,0x1B,MIDI_LSB}},
				{name='PAD 15', label='15', objectType='Drumpad', midiType='Momentary', midi={0xB0,0x1C,MIDI_LSB}},
				{name='PAD 16', label='16', objectType='Drumpad', midiType='Momentary', midi={0xB0,0x1D,MIDI_LSB}},
			}
		}
end
