-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'ReMOTE SL',
		-- manufacturer name for this device
		manufacturer = 'Novation DMS',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='ReMOTE SL', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				-- LAST KNOB ALWAYS SET TO MASTER VOLUME
				{name='Fader 8', label='Volume', objectType='VFader', midi={0xB0,0x75,MIDI_LSB}},			
				-- Knob Row 1
				{name='Knob 1', label='1', objectType='Knob', midi={0xB0,0x14,MIDI_LSB}},
				{name='Knob 2', label='2', objectType='Knob', midi={0xB0,0x15,MIDI_LSB}},
				{name='Knob 3', label='3', objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},
				{name='Knob 4', label='4', objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},
				{name='Knob 5', label='5', objectType='Knob', midi={0xB0,0x18,MIDI_LSB}},
				{name='Knob 6', label='6', objectType='Knob', midi={0xB0,0x19,MIDI_LSB}},
				{name='Knob 7', label='7', objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Knob 8', label='8', objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
				-- Button Column 1 Row 1
				{name='Button 1', label='K1', objectType='Alternating', midi={0xB0,0x66,MIDI_LSB}},
				{name='Button 2', label='K2', objectType='Alternating', midi={0xB0,0x67,MIDI_LSB}},
				{name='Button 3', label='K3', objectType='Alternating', midi={0xB0,0x68,MIDI_LSB}},
				{name='Button 4', label='K4', objectType='Alternating', midi={0xB0,0x69,MIDI_LSB}},
				{name='Button 5', label='K5', objectType='Alternating', midi={0xB0,0x6A,MIDI_LSB}},
				{name='Button 6', label='K6', objectType='Alternating', midi={0xB0,0x6B,MIDI_LSB}},
				{name='Button 7', label='K7', objectType='Alternating', midi={0xB0,0x6C,MIDI_LSB}},
				{name='Button 8', label='K8', objectType='Alternating', midi={0xB0,0x6D,MIDI_LSB}},
				-- Knob Row 2
				{name='Knob 1', label='1', objectType='Knob', midi={0xB0,0x66,MIDI_LSB}},
				{name='Knob 2', label='2', objectType='Knob', midi={0xB0,0x67,MIDI_LSB}},
				{name='Knob 3', label='3', objectType='Knob', midi={0xB0,0x68,MIDI_LSB}},
				{name='Knob 4', label='4', objectType='Knob', midi={0xB0,0x69,MIDI_LSB}},
				{name='Knob 5', label='5', objectType='Knob', midi={0xB0,0x6A,MIDI_LSB}},
				{name='Knob 6', label='6', objectType='Knob', midi={0xB0,0x6B,MIDI_LSB}},
				{name='Knob 7', label='7', objectType='Knob', midi={0xB0,0x6C,MIDI_LSB}},
				{name='Knob 8', label='8', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},
				-- Pad Row 1
				{name='Pad 1', label='PAD 1', objectType='Drumpad', midiType='Note', midi={0x91,0x3C,MIDI_LSB}},
				{name='Pad 2', label='PAD 2', objectType='Drumpad', midiType='Note', midi={0x91,0x3D,MIDI_LSB}},
				{name='Pad 3', label='PAD 3', objectType='Drumpad', midiType='Note', midi={0x91,0x3E,MIDI_LSB}},
				{name='Pad 4', label='PAD 4', objectType='Drumpad', midiType='Note', midi={0x91,0x3F,MIDI_LSB}},
				{name='Pad 5', label='PAD 5', objectType='Drumpad', midiType='Note', midi={0x91,0x40,MIDI_LSB}},
				{name='Pad 6', label='PAD 6', objectType='Drumpad', midiType='Note', midi={0x91,0x41,MIDI_LSB}},
				{name='Pad 7', label='PAD 7', objectType='Drumpad', midiType='Note', midi={0x91,0x42,MIDI_LSB}},
				{name='Pad 8', label='PAD 8', objectType='Drumpad', midiType='Note', midi={0x91,0x43,MIDI_LSB}},
				-- Vertical Fader Row 1
				{name='Fader 1', label='1', objectType='VFader', midi={0xB0,0x6E,MIDI_LSB}},
				{name='Fader 2', label='2', objectType='VFader', midi={0xB0,0x6F,MIDI_LSB}},
				{name='Fader 3', label='3', objectType='VFader', midi={0xB0,0x70,MIDI_LSB}},
				{name='Fader 4', label='4', objectType='VFader', midi={0xB0,0x71,MIDI_LSB}},
				{name='Fader 5', label='5', objectType='VFader', midi={0xB0,0x72,MIDI_LSB}},
				{name='Fader 6', label='6', objectType='VFader', midi={0xB0,0x73,MIDI_LSB}},
				{name='Fader 7', label='7', objectType='VFader', midi={0xB0,0x74,MIDI_LSB}},
				-- Button Column 2 Row 1
				{name='Button 1', label='1', objectType='Momentary', midi={0xB0,0x46,MIDI_LSB}},
				{name='Button 2', label='2', objectType='Momentary', midi={0xB0,0x47,MIDI_LSB}},
				{name='Button 3', label='3', objectType='Momentary', midi={0xB0,0x48,MIDI_LSB}},
				{name='Button 4', label='4', objectType='Momentary', midi={0xB0,0x49,MIDI_LSB}},
				{name='Button 5', label='5', objectType='Momentary', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Button 6', label='6', objectType='Momentary', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Button 7', label='7', objectType='Momentary', midi={0xB0,0x4C,MIDI_LSB}},
				{name='Button 8', label='8', objectType='Momentary', midi={0xB0,0x4D,MIDI_LSB}},
				-- Button Column 2 Row 2
				{name='Button 1', label='1', objectType='Momentary', midi={0xB0,0x4E,MIDI_LSB}},
				{name='Button 2', label='2', objectType='Momentary', midi={0xB0,0x4F,MIDI_LSB}},
				{name='Button 3', label='3', objectType='Momentary', midi={0xB0,0x50,MIDI_LSB}},
				{name='Button 4', label='4', objectType='Momentary', midi={0xB0,0x51,MIDI_LSB}},
				{name='Button 5', label='5', objectType='Momentary', midi={0xB0,0x52,MIDI_LSB}},
				{name='Button 6', label='6', objectType='Momentary', midi={0xB0,0x53,MIDI_LSB}},
				{name='Button 7', label='7', objectType='Momentary', midi={0xB0,0x54,MIDI_LSB}},
				{name='Button 8', label='8', objectType='Momentary', midi={0xB0,0x55,MIDI_LSB}},				
				-- Transport Controls
				{name='Rewind', label='◀◀', objectType='Button', midiType='Single', midi={0xBF,0x73,MIDI_LSB}},
				{name='Forward', label='▶▶', objectType='Button', midiType='Single', midi={0xBF,0x74,MIDI_LSB}},
				{name='Stop', label='■', objectType='Button', midiType='Single', midi={0xBF,0x75,MIDI_LSB}},
				{name='Play', label='▶', objectType='Button', midiType='Single', midi={0xBF,0x76,MIDI_LSB}},
				{name='Loop', label='loop', objectType='Button', midiType='Single', midi={0xBF,0x77,MIDI_LSB}},
				{name='Record', label='●', objectType='Button', midiType='Single', midi={0xBF,0x77,MIDI_LSB}},
		}
	}
end