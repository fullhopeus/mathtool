-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'TRITON taktile-49',
		-- manufacturer name for this device
		manufacturer = 'Korg',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Sound Button On',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
--		device_inquiry = {0xF0,0x7E,0x00,0x06,0x02,0x42,0x02,0x01,0x00,0x00,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='PITCH', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='MOD', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='TRITON taktile-49', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Fader 8', label='Volume', objectType='VFader',midi={0xB0,31,MIDI_LSB}},

				{name='Knob 1', label='Knob 1', objectType='Knob',midi={0xB0,16,MIDI_LSB}},
				{name='Knob 2', label='Knob 2', objectType='Knob',midi={0xB0,17,MIDI_LSB}},
				{name='Knob 3', label='Knob 3', objectType='Knob',midi={0xB0,18,MIDI_LSB}},
				{name='Knob 4', label='Knob 4', objectType='Knob',midi={0xB0,19,MIDI_LSB}},
				{name='Knob 5', label='Knob 5', objectType='Knob',midi={0xB0,20,MIDI_LSB}},
				{name='Knob 6', label='Knob 6', objectType='Knob',midi={0xB0,21,MIDI_LSB}},
				{name='Knob 7', label='Knob 7', objectType='Knob',midi={0xB0,22,MIDI_LSB}},				
				{name='Knob 8', label='Knob 8', objectType='Knob',midi={0xB0,23,MIDI_LSB}},

				{name='Fader 1', label='Fader 1', objectType='VFader',midi={0xB0,24,MIDI_LSB}},
				{name='Fader 2', label='Fader 2', objectType='VFader',midi={0xB0,25,MIDI_LSB}},
				{name='Fader 3', label='Fader 3', objectType='VFader',midi={0xB0,26,MIDI_LSB}},
				{name='Fader 4', label='Fader 4', objectType='VFader',midi={0xB0,27,MIDI_LSB}},
				{name='Fader 5', label='Fader 5', objectType='VFader',midi={0xB0,28,MIDI_LSB}},
				{name='Fader 6', label='Fader 6', objectType='VFader',midi={0xB0,29,MIDI_LSB}},
				{name='Fader 7', label='Fader 7', objectType='VFader',midi={0xB0,30,MIDI_LSB}},
				
				{name='Solo 1', label='F1', objectType='Button', midiType='Momentary', midi={0xB0,32,MIDI_LSB}},
				{name='Solo 2', label='F2', objectType='Button', midiType='Momentary', midi={0xB0,33,MIDI_LSB}},
				{name='Solo 3', label='F3', objectType='Button', midiType='Momentary', midi={0xB0,34,MIDI_LSB}},
				{name='Solo 4', label='F4', objectType='Button', midiType='Momentary', midi={0xB0,35,MIDI_LSB}},
				{name='Solo 5', label='F5', objectType='Button', midiType='Momentary', midi={0xB0,36,MIDI_LSB}},
				{name='Solo 6', label='F6', objectType='Button', midiType='Momentary', midi={0xB0,37,MIDI_LSB}},
				{name='Solo 7', label='F7', objectType='Button', midiType='Momentary', midi={0xB0,38,MIDI_LSB}},
				{name='Solo 8', label='F8', objectType='Button', midiType='Momentary', midi={0xB0,39,MIDI_LSB}},

				{name='Mute 1', label='F1', objectType='Button', midiType='Momentary', midi={0xB0,48,MIDI_LSB}},
				{name='Mute 2', label='F2', objectType='Button', midiType='Momentary', midi={0xB0,49,MIDI_LSB}},
				{name='Mute 3', label='F3', objectType='Button', midiType='Momentary', midi={0xB0,50,MIDI_LSB}},
				{name='Mute 4', label='F4', objectType='Button', midiType='Momentary', midi={0xB0,51,MIDI_LSB}},
				{name='Mute 5', label='F5', objectType='Button', midiType='Momentary', midi={0xB0,52,MIDI_LSB}},
				{name='Mute 6', label='F6', objectType='Button', midiType='Momentary', midi={0xB0,53,MIDI_LSB}},
				{name='Mute 7', label='F7', objectType='Button', midiType='Momentary', midi={0xB0,54,MIDI_LSB}},
				{name='Mute 8', label='F8', objectType='Button', midiType='Momentary', midi={0xB0,56,MIDI_LSB}},

				{name='Rec 1', label='F1', objectType='Button', midiType='Momentary', midi={0xB0,83,MIDI_LSB}},
				{name='Rec 2', label='F2', objectType='Button', midiType='Momentary', midi={0xB0,84,MIDI_LSB}},
				{name='Rec 3', label='F3', objectType='Button', midiType='Momentary', midi={0xB0,85,MIDI_LSB}},
				{name='Rec 4', label='F4', objectType='Button', midiType='Momentary', midi={0xB0,86,MIDI_LSB}},
				{name='Rec 5', label='F5', objectType='Button', midiType='Momentary', midi={0xB0,87,MIDI_LSB}},
				{name='Rec 6', label='F6', objectType='Button', midiType='Momentary', midi={0xB0,88,MIDI_LSB}},
				{name='Rec 7', label='F7', objectType='Button', midiType='Momentary', midi={0xB0,89,MIDI_LSB}},
				{name='Rec 8', label='F8', objectType='Button', midiType='Momentary', midi={0xB0,90,MIDI_LSB}},								
				
				{name='Track ▶', label='Track ▶', objectType='Button', midiType='Momentary', midi={0xB0,59,MIDI_LSB}},
				{name='Track ◀', label='Track ◀', objectType='Button', midiType='Momentary', midi={0xB0,58,MIDI_LSB}},
				
				{name='X', label='X', objectType='VFader', midiType='Absolute', midi={0xB0,12,MIDI_LSB}},
				{name='Y', label='Y', objectType='VFader', midiType='Absolute', midi={0xB0,13,MIDI_LSB}},
				
				{name='X-Y Pad touched', label='X-Y Pad touched', objectType='Momentary', midi={0xB0,92,MIDI_LSB}},

				{name='Pad 1', label='1', objectType='Drumpad', midiType='Note', midi={0x90,37,MIDI_LSB}},
				{name='Pad 2', label='2', objectType='Drumpad', midiType='Note', midi={0x90,39,MIDI_LSB}},
				{name='Pad 3', label='3', objectType='Drumpad', midiType='Note', midi={0x90,41,MIDI_LSB}},
				{name='Pad 4', label='4', objectType='Drumpad', midiType='Note', midi={0x90,43,MIDI_LSB}},												
				{name='Pad 5', label='5', objectType='Drumpad', midiType='Note', midi={0x90,45,MIDI_LSB}},
				{name='Pad 6', label='6', objectType='Drumpad', midiType='Note', midi={0x90,47,MIDI_LSB}},
				{name='Pad 7', label='7', objectType='Drumpad', midiType='Note', midi={0x90,49,MIDI_LSB}},
				{name='Pad 8', label='8', objectType='Drumpad', midiType='Note', midi={0x90,51,MIDI_LSB}},

				{name='Pad 9', label='9', objectType='Drumpad', midiType='Note', midi={0x90,36,MIDI_LSB}},
				{name='Pad 10', label='10', objectType='Drumpad', midiType='Note', midi={0x90,38,MIDI_LSB}},
				{name='Pad 11', label='11', objectType='Drumpad', midiType='Note', midi={0x90,40,MIDI_LSB}},
				{name='Pad 12', label='12', objectType='Drumpad', midiType='Note', midi={0x90,42,MIDI_LSB}},												
				{name='Pad 13', label='13', objectType='Drumpad', midiType='Note', midi={0x90,44,MIDI_LSB}},
				{name='Pad 14', label='14', objectType='Drumpad', midiType='Note', midi={0x90,46,MIDI_LSB}},
				{name='Pad 15', label='15', objectType='Drumpad', midiType='Note', midi={0x90,48,MIDI_LSB}},
				{name='Pad 16', label='16', objectType='Drumpad', midiType='Note', midi={0x90,50,MIDI_LSB}},

				{name='Rewind', label='Rewind', objectType='Button', midiType='Momentary', midi={0xB0,43,MIDI_LSB}},
				{name='Forward', label='Forward', objectType='Button', midiType='Momentary', midi={0xB0,44,MIDI_LSB}},
				{name='Stop', label='Stop', objectType='Button', midiType='Momentary', midi={0xB0,42,MIDI_LSB}},
				{name='Play', label='Play', objectType='Button', midiType='Momentary', midi={0xB0,41,MIDI_LSB}},
				{name='Record', label='Record', objectType='Button', midiType='Momentary', midi={0xB0,45,MIDI_LSB}},
				{name='Cycle', label='Cycle', objectType='Button', midiType='Momentary', midi={0xB0,46,MIDI_LSB}},														
			}
		}
end