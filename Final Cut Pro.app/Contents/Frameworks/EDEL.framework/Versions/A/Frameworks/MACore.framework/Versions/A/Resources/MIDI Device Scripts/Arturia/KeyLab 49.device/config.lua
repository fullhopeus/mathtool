
SysexValues =
{
	-- P1-P5
	[0x4A] = 1,
	[0x47] = 2,
	[0x4C] = 3,
	[0x4D] = 4,
	[0x5D] = 9,

    -- P6-P10
	[0x12] = 5,
	[0x13] = 6,
	[0x10] = 7,
	[0x11] = 8,
	[0x5B] = 0x0a,

	--Volume
	[0x07] = 0x30,
}

function controller_midi_out(midiEvent,name,valueString,color)
	if midiEvent[0] == 0xB0 then
		receivedEvents = true
		if SysexValues[midiEvent[1]] then
			--print("converting cc to sysex")
			--print(midiEvent[0],midiEvent[1],midiEvent[2],name,valueString,color, SysexValues[midiEvent[1]])
			return {midi={0xf0,0x00,0x20,0x6B,0x7F,0x42,0x02, 0x00, 0x00, SysexValues[midiEvent[1]], midiEvent[2], 0xf7
						 }, outport='KeyLab 49'}
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
		model = 'KeyLab 49',
		-- manufacturer name for this device
		manufacturer = 'Arturia',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='KeyLab 49', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Volume', label='Volume', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}, outport='KeyLab 49'},
				-- BANK 1
				{name='Knob 1', label='Cutoff', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 2', label='Resonance', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 3', label='LFO Rate', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 4', label='LFO Amount', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 5', label='Chorus Amount', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 6', label='Param 1', objectType='Knob', midi={0xB0,0x12,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 7', label='Param 2', objectType='Knob', midi={0xB0,0x13,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 8', label='Param 3', objectType='Knob', midi={0xB0,0x10,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 9', label='Param 4', objectType='Knob', midi={0xB0,0x11,MIDI_LSB}, outport='KeyLab 49'},
				{name='Knob 10', label='Delay Amount', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}, outport='KeyLab 49'},
				-- FADERS
				{name='Fader 1', label='F1', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 2', label='F2', objectType='VFader', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Fader 3', label='F3', objectType='VFader', midi={0xB0,0x4F,MIDI_LSB}},
				{name='Fader 4', label='F4', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 5', label='F5', objectType='VFader', midi={0xB0,0x50,MIDI_LSB}},
				{name='Fader 6', label='F6', objectType='VFader', midi={0xB0,0x51,MIDI_LSB}},
				{name='Fader 7', label='F7', objectType='VFader', midi={0xB0,0x52,MIDI_LSB}},
				{name='Fader 8', label='F8', objectType='VFader', midi={0xB0,0x53,MIDI_LSB}},
				{name='Fader 9', label='F9', objectType='VFader', midi={0xB0,0x55,MIDI_LSB}},
				-- BANK 2
				{name='Knob 1', label='P1', objectType='Knob', midi={0xB0,0x23,MIDI_LSB}},
				{name='Knob 2', label='P2', objectType='Knob', midi={0xB0,0x24,MIDI_LSB}},
				{name='Knob 3', label='P3', objectType='Knob', midi={0xB0,0x25,MIDI_LSB}},
				{name='Knob 4', label='P4', objectType='Knob', midi={0xB0,0x26,MIDI_LSB}},
				{name='Knob 5', label='P5', objectType='Knob', midi={0xB0,0x27,MIDI_LSB}},
				{name='Knob 6', label='P6', objectType='Knob', midi={0xB0,0x28,MIDI_LSB}},
				{name='Knob 7', label='P7', objectType='Knob', midi={0xB0,0x29,MIDI_LSB}},
				{name='Knob 8', label='P8', objectType='Knob', midi={0xB0,0x2A,MIDI_LSB}},
				{name='Knob 9', label='P9', objectType='Knob', midi={0xB0,0x2B,MIDI_LSB}},
				{name='Knob 10', label='P10', objectType='Knob', midi={0xB0,0x2C,MIDI_LSB}},
				-- FADERS
				{name='Fader 1', label='F1', objectType='VFader', midi={0xB0,0x43,MIDI_LSB}},
				{name='Fader 2', label='F2', objectType='VFader', midi={0xB0,0x44,MIDI_LSB}},
				{name='Fader 3', label='F3', objectType='VFader', midi={0xB0,0x45,MIDI_LSB}},
				{name='Fader 4', label='F4', objectType='VFader', midi={0xB0,0x46,MIDI_LSB}},
				{name='Fader 5', label='F5', objectType='VFader', midi={0xB0,0x57,MIDI_LSB}},
				{name='Fader 6', label='F6', objectType='VFader', midi={0xB0,0x58,MIDI_LSB}},
				{name='Fader 7', label='F7', objectType='VFader', midi={0xB0,0x59,MIDI_LSB}},
				{name='Fader 8', label='F8', objectType='VFader', midi={0xB0,0x5A,MIDI_LSB}},
				{name='Fader 9', label='F9', objectType='VFader', midi={0xB0,0x5C,MIDI_LSB}},
				-- BUTTONS
				{name='Button 1', label='1', objectType='Button', midiType='Momentary', midi={0xB0,0x16,MIDI_LSB}},
				{name='Button 2', label='2', objectType='Button', midiType='Momentary', midi={0xB0,0x17,MIDI_LSB}},
				{name='Button 3', label='3', objectType='Button', midiType='Momentary', midi={0xB0,0x18,MIDI_LSB}},
				{name='Button 4', label='4', objectType='Button', midiType='Momentary', midi={0xB0,0x19,MIDI_LSB}},
				{name='Button 5', label='5', objectType='Button', midiType='Momentary', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Button 6', label='6', objectType='Button', midiType='Momentary', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Button 7', label='7', objectType='Button', midiType='Momentary', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Button 8', label='8', objectType='Button', midiType='Momentary', midi={0xB0,0x1D,MIDI_LSB}},
				{name='Button 9', label='9', objectType='Button', midiType='Momentary', midi={0xB0,0x1E,MIDI_LSB}},
				{name='Button 10', label='10', objectType='Button', midiType='Momentary', midi={0xB0,0x1F,MIDI_LSB}},

				{name='REWIND', label='REWIND', objectType='Button', midiType='Momentary', midi={0xB0,0x35,MIDI_LSB}},
				{name='FORWARD', label='FORWARD', objectType='Button', midiType='Momentary', midi={0xB0,0x34,MIDI_LSB}},
				{name='STOP', label='STOP', objectType='Button', midiType='Momentary', midi={0xB0,0x33,MIDI_LSB}},
				{name='PLAY', label='PLAY', objectType='Button', midiType='Momentary', midi={0xB0,0x36,MIDI_LSB}},
				{name='RECORD', label='RECORD', objectType='Button', midiType='Momentary', midi={0xB0,0x32,MIDI_LSB}},
				{name='CYCLE', label='CYCLE', objectType='Button', midiType='Momentary', midi={0xB0,0x37,MIDI_LSB}},

				{name='Endless Knob 1', label='Category', objectType='Knob', midiType='DirectionAndSpeed', midi={0xB0,0x70,MIDI_LSB}},
				{name='Endless Knob 2', label='Preset', objectType='Knob', midiType='DirectionAndSpeed', midi={0xB0,0x72,MIDI_LSB}},

				{name='Sound', label='Sound', objectType='Button', midiType='Momentary', midi={0xB0,0x76,MIDI_LSB}},
				{name='Multi', label='Multi', objectType='Button', midiType='Momentary', midi={0xB0,0x77,MIDI_LSB}},
				
				{name='Pad 13', label='Pad 13', objectType='Drumpad', midiType='Note', midi={0x99,0x30,MIDI_LSB}},
				{name='Pad 14', label='Pad 14', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}},
				{name='Pad 15', label='Pad 15', objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}},
				{name='Pad 16', label='Pad 16', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}},

				{name='Pad 9', label='Pad 9', objectType='Drumpad', midiType='Note', midi={0x99,0x2C,MIDI_LSB}},
				{name='Pad 10', label='Pad 10', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}},
				{name='Pad 11', label='Pad 11', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}},
				{name='Pad 12', label='Pad 12', objectType='Drumpad', midiType='Note', midi={0x99,0x2F,MIDI_LSB}},

				{name='Pad 5', label='Pad 5', objectType='Drumpad', midiType='Note', midi={0x99,0x28,MIDI_LSB}},
				{name='Pad 6', label='Pad 6', objectType='Drumpad', midiType='Note', midi={0x99,0x29,MIDI_LSB}},
				{name='Pad 7', label='Pad 7', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}},
				{name='Pad 8', label='Pad 8', objectType='Drumpad', midiType='Note', midi={0x99,0x2B,MIDI_LSB}},

				{name='Pad 1', label='Pad 1', objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}},
				{name='Pad 2', label='Pad 2', objectType='Drumpad', midiType='Note', midi={0x99,0x25,MIDI_LSB}},
				{name='Pad 3', label='Pad 3', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}},
				{name='Pad 4', label='Pad 4', objectType='Drumpad', midiType='Note', midi={0x99,0x27,MIDI_LSB}},
			}
		}
end
