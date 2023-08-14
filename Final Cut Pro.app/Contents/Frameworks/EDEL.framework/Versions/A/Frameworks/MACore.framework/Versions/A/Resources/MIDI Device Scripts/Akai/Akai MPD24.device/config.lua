-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'MPD24',
		-- manufacturer name for this device
		manufacturer = 'Akai',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Reason',

		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Keyboard', label='MPD24', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=16, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},
				
				{name='Fader 6', label='Volume', objectType='VFader',midi={0xB0,0x15,MIDI_LSB}},
				
				{name='Fader 1', label='F1', objectType='VFader',midi={0xB0,0x10,MIDI_LSB}},
				{name='Fader 2', label='F2', objectType='VFader',midi={0xB0,0x11,MIDI_LSB}},
				{name='Fader 3', label='F3', objectType='VFader',midi={0xB0,0x12,MIDI_LSB}},
				{name='Fader 4', label='F4', objectType='VFader',midi={0xB0,0x13,MIDI_LSB}},
				{name='Fader 5', label='F5', objectType='VFader',midi={0xB0,0x14,MIDI_LSB}},

				{name='Knob 7', label='K7', objectType='Knob',midi={0xB0,0x24,MIDI_LSB}},
				{name='Knob 8', label='K8', objectType='Knob',midi={0xB0,0x25,MIDI_LSB}},
				{name='Knob 5', label='K5', objectType='Knob',midi={0xB0,0x22,MIDI_LSB}},
				{name='Knob 6', label='K6', objectType='Knob',midi={0xB0,0x23,MIDI_LSB}},
				{name='Knob 3', label='K3', objectType='Knob',midi={0xB0,0x20,MIDI_LSB}},
				{name='Knob 4', label='K4', objectType='Knob',midi={0xB0,0x21,MIDI_LSB}},
				{name='Knob 1', label='K1', objectType='Knob',midi={0xB0,0x1E,MIDI_LSB}},
				{name='Knob 2', label='K2', objectType='Knob',midi={0xB0,0x1F,MIDI_LSB}},

				{name='Backward', label='Backward', objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x05,0xF7}},
				{name='Forward', label='Forward', objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x04,0xF7}},
				{name='Stop', label='Stop', objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x01,0xF7}},
				{name='Play', label='Play', objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x02,0xF7}},
				{name='Record', label='Record', objectType='Button', midiType='Single', midi={0xF0,0x7F,0x7F,0x06,0x06,0xF7}},
	
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
