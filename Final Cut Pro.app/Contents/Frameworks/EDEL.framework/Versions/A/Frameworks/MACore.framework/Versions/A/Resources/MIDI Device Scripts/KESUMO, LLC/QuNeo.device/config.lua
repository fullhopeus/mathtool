-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'QUNEO',
		-- manufacturer name for this device
		manufacturer = 'Keith McMillen Instruments',
		
		preset_name = 'Preset 1',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Keyboard', label='QuNexus', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=16, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				
				{name='Arrow Button UP 1', label='U1', objectType='Button', midiType='Note', midi={0x90,0x14,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button DOWN 1', label='D1', objectType='Button', midiType='Note', midi={0x90,0x15,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button UP 2', label='U2', objectType='Button', midiType='Note', midi={0x90,0x16,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button DOWN 2', label='D2', objectType='Button', midiType='Note', midi={0x90,0x17,MIDI_LSB}, outport='Port 1'},
 
				{name='Arrow Button L1', label='L1', objectType='Button', midiType='Note', midi={0x90,0x0B,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button R1', label='R1', objectType='Button', midiType='Note', midi={0x90,0x0C,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button L2', label='L2', objectType='Button', midiType='Note', midi={0x90,0x0D,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button R2', label='R2', objectType='Button', midiType='Note', midi={0x90,0x0E,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button L3', label='L3', objectType='Button', midiType='Note', midi={0x90,0x0F,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button R3', label='R3', objectType='Button', midiType='Note', midi={0x90,0x10,MIDI_LSB}, outport='Port 1'},				
				{name='Arrow Button L4', label='L4', objectType='Button', midiType='Note', midi={0x90,0x11,MIDI_LSB}, outport='Port 1'},
				{name='Arrow Button R4', label='R4', objectType='Button', midiType='Note', midi={0x90,0x12,MIDI_LSB}, outport='Port 1'},
				
				{name='Record', label='Record', objectType='Button', midiType='Note', midi={0x90,0x18,MIDI_LSB}, outport='Port 1'},
				{name='Stop', label='Stop', objectType='Button', midiType='Note', midi={0x90,0x19,MIDI_LSB}, outport='Port 1'},
				{name='Play', label='Play', objectType='Button', midiType='Note', midi={0x90,0x1A,MIDI_LSB}, outport='Port 1'},

				{name='Rhombus', label='Rhombus', objectType='Button', midiType='Note', midi={0x90,0x13,MIDI_LSB}, outport='Port 1'},

				{name='XFader 1', label='Volume', objectType='VFader',midi={0xB0,0x0A,MIDI_LSB}},

				{name='HFader 1', label='F1', objectType='VFader',midi={0xB0,0x00,MIDI_LSB}},
				{name='HFader 2', label='F2', objectType='VFader',midi={0xB0,0x01,MIDI_LSB}},
				{name='HFader 3', label='F3', objectType='VFader',midi={0xB0,0x02,MIDI_LSB}},
				{name='HFader 4', label='F4', objectType='VFader',midi={0xB0,0x03,MIDI_LSB}},
				
				{name='VFader 1', label='F5', objectType='VFader',midi={0xB0,0x06,MIDI_LSB}},
				{name='VFader 2', label='F6', objectType='VFader',midi={0xB0,0x07,MIDI_LSB}},
				{name='VFader 3', label='F7', objectType='VFader',midi={0xB0,0x08,MIDI_LSB}},
				{name='VFader 4', label='F8', objectType='VFader',midi={0xB0,0x09,MIDI_LSB}},
				
				{name='Rotary 1', label='Rotary 1', objectType='VFader',midi={0xB0,0x04,MIDI_LSB}},
				{name='Rotary 2', label='Rotary 2', objectType='VFader',midi={0xB0,0x05,MIDI_LSB}},

				{name='Pad 1',  label='Pad 13', objectType='Drumpad', midiType='Note', midi={0x90,0x30,MIDI_LSB}},
				{name='Pad 2',  label='Pad 14', objectType='Drumpad', midiType='Note', midi={0x90,0x31,MIDI_LSB}},
				{name='Pad 3',  label='Pad 15', objectType='Drumpad', midiType='Note', midi={0x90,0x32,MIDI_LSB}},
				{name='Pad 4',  label='Pad 16', objectType='Drumpad', midiType='Note', midi={0x90,0x33,MIDI_LSB}},
				{name='Pad 5',   label='Pad 9', objectType='Drumpad', midiType='Note', midi={0x90,0x2C,MIDI_LSB}},
				{name='Pad 6',  label='Pad 10', objectType='Drumpad', midiType='Note', midi={0x90,0x2D,MIDI_LSB}},
				{name='Pad 7',  label='Pad 11', objectType='Drumpad', midiType='Note', midi={0x90,0x2E,MIDI_LSB}},
				{name='Pad 8',  label='Pad 12', objectType='Drumpad', midiType='Note', midi={0x90,0x2F,MIDI_LSB}},
				{name='Pad 9',   label='Pad 9', objectType='Drumpad', midiType='Note', midi={0x90,0x28,MIDI_LSB}},
				{name='Pad 10', label='Pad 10', objectType='Drumpad', midiType='Note', midi={0x90,0x29,MIDI_LSB}},
				{name='Pad 11', label='Pad 11', objectType='Drumpad', midiType='Note', midi={0x90,0x2A,MIDI_LSB}},
				{name='Pad 12', label='Pad 12', objectType='Drumpad', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},
				{name='Pad 13',  label='Pad 9', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				{name='Pad 14', label='Pad 10', objectType='Drumpad', midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				{name='Pad 15', label='Pad 11', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				{name='Pad 16', label='Pad 12', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},
			}
		}
end
