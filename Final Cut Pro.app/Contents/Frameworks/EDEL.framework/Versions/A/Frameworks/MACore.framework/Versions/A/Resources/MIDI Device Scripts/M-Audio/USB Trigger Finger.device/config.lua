-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Trigger Finger',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		device_request = { 0xF0,0x7E,0x7F,0x06,0x01,0xF7 },

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x63,0x0E,0x17,0x02,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				{name='Keyboard', label='Trigger Finger', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=16, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				-- The default midiType is 'Absolute', it only has to be defined, if it is different

				{name='Fader 4', label='Volume', objectType='VFader', midi={0xB9,0x4A,MIDI_LSB}},

				{name='Knob 1', label='C5', objectType='Knob', midi={0xB9,0x5B,MIDI_LSB}},
				{name='Knob 2', label='C6', objectType='Knob', midi={0xB9,0x5D,MIDI_LSB}},
				{name='Knob 3', label='C7', objectType='Knob', midi={0xB9,0x47,MIDI_LSB}},
				{name='Knob 4', label='C8', objectType='Knob', midi={0xB9,0x48,MIDI_LSB}},                                
				{name='Knob 5', label='C1', objectType='Knob', midi={0xB9,0x0A,MIDI_LSB}},
				{name='Knob 6', label='C2', objectType='Knob', midi={0xB9,0x0C,MIDI_LSB}},
				{name='Knob 7', label='C3', objectType='Knob', midi={0xB9,0x05,MIDI_LSB}},
				{name='Knob 8', label='C4', objectType='Knob', midi={0xB9,0x54,MIDI_LSB}},

				{name='Fader 1', label='F1', objectType='VFader', midi={0xB9,0x07,MIDI_LSB}},
				{name='Fader 2', label='F2', objectType='VFader', midi={0xB9,0x01,MIDI_LSB}},
				{name='Fader 3', label='F3', objectType='VFader', midi={0xB9,0x47,MIDI_LSB}},
                                                                                                 
				{name='Pad 13', label='P13', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}},
				{name='Pad 14', label='P14', objectType='Drumpad', midiType='Note', midi={0x99,0x39,MIDI_LSB}},
				{name='Pad 15', label='P15', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}},
				{name='Pad 16', label='P16', objectType='Drumpad', midiType='Note', midi={0x99,0x35,MIDI_LSB}},
				{name='Pad 9',  label='P9',  objectType='Drumpad', midiType='Note', midi={0x99,0x38,MIDI_LSB}},
				{name='Pad 10', label='P10', objectType='Drumpad', midiType='Note', midi={0x99,0x27,MIDI_LSB}},
				{name='Pad 11', label='P11', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}},
				{name='Pad 12', label='P12', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}},
				{name='Pad 5',  label='P5',  objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}},
				{name='Pad 6',  label='P6',  objectType='Drumpad', midiType='Note', midi={0x99,0x30,MIDI_LSB}},
				{name='Pad 7',  label='P7',  objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}},
				{name='Pad 8',  label='P8',  objectType='Drumpad', midiType='Note', midi={0x99,0x29,MIDI_LSB}},
				{name='Pad 1',  label='P1',  objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}},
				{name='Pad 2',  label='P2',  objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}},
				{name='Pad 3',  label='P3',  objectType='Drumpad', midiType='Note', midi={0x99,0x28,MIDI_LSB}},
				{name='Pad 4',  label='P4',  objectType='Drumpad', midiType='Note', midi={0x99,0x25,MIDI_LSB}},
			}
		}
end
