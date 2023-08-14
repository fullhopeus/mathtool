-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'MPK25',
		-- manufacturer name for this device
		manufacturer = 'Akai',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset "Live Lite"',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Mod', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='MPK25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Knob 12', label='Volume', objectType='Knob', midi={0xB0,0x0F,MIDI_LSB}},

				{name='Knob 1', label='K1', objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},
				{name='Knob 2', label='K2', objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},
				{name='Knob 3', label='K3', objectType='Knob', midi={0xB0,0x18,MIDI_LSB}},
				{name='Knob 4', label='K4', objectType='Knob', midi={0xB0,0x19,MIDI_LSB}},
				{name='Knob 5', label='K5', objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Knob 6', label='K6', objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Knob 7', label='K7', objectType='Knob', midi={0xB0,0x1C,MIDI_LSB}},
				{name='Knob 8', label='K8', objectType='Knob', midi={0xB0,0x1D,MIDI_LSB}},
				{name='Knob 9', label='K9', objectType='Knob', midi={0xB0,0x0C,MIDI_LSB}},
				{name='Knob 10', label='K10', objectType='Knob', midi={0xB0,0x0D,MIDI_LSB}},
				{name='Knob 11', label='K11', objectType='Knob', midi={0xB0,0x0E,MIDI_LSB}},
				
				{name='Button 1', label='S1', objectType='Button', midiType='Momentary', midi={0xB0,0x20,MIDI_LSB}},
				{name='Button 2', label='S2', objectType='Button', midiType='Momentary', midi={0xB0,0x21,MIDI_LSB}},
				{name='Button 3', label='S3', objectType='Button', midiType='Momentary', midi={0xB0,0x22,MIDI_LSB}},
				{name='Button 4', label='S4', objectType='Button', midiType='Momentary', midi={0xB0,0x23,MIDI_LSB}},

				{name='Rewind', label='◀◀', objectType='Button', midiType='Single', midi={0xB0,0x73,MIDI_LSB}},
				{name='Forward', label='▶▶', objectType='Button', midiType='Single', midi={0xB0,0x74,MIDI_LSB}},
				{name='Stop', label='STOP', objectType='Button', midiType='Single', midi={0xB0,0x75,MIDI_LSB}},
				{name='Play', label='PLAY', objectType='Button', midiType='Single', midi={0xB0,0x76,MIDI_LSB}},
				{name='Record', label='REC', objectType='Button', midiType='Single', midi={0xB0,0x77,MIDI_LSB}},
				-- Pad Row 1
				{name='Pad 10', label='PAD 10', objectType='Drumpad', midiType='Note', midi={0x91,0x4C,MIDI_LSB}},
				{name='Pad 11', label='PAD 11', objectType='Drumpad', midiType='Note', midi={0x91,0x4D,MIDI_LSB}},
				{name='Pad 12', label='PAD 12', objectType='Drumpad', midiType='Note', midi={0x91,0x4E,MIDI_LSB}},
				-- Pad Row 2
				{name='Pad 7', label='PAD 7', objectType='Drumpad', midiType='Note', midi={0x91,0x47,MIDI_LSB}},
				{name='Pad 8', label='PAD 8', objectType='Drumpad', midiType='Note', midi={0x91,0x48,MIDI_LSB}},
				{name='Pad 9', label='PAD 9', objectType='Drumpad', midiType='Note', midi={0x91,0x4A,MIDI_LSB}},
				-- Pad Row 3
				{name='Pad 4', label='PAD 4', objectType='Drumpad', midiType='Note', midi={0x91,0x41,MIDI_LSB}},
				{name='Pad 5', label='PAD 5', objectType='Drumpad', midiType='Note', midi={0x91,0x43,MIDI_LSB}},
				{name='Pad 6', label='PAD 6', objectType='Drumpad', midiType='Note', midi={0x91,0x45,MIDI_LSB}},				
				-- Pad Row 4
				{name='Pad 1', label='PAD 1', objectType='Drumpad', midiType='Note', midi={0x91,0x3C,MIDI_LSB}},
				{name='Pad 2', label='PAD 2', objectType='Drumpad', midiType='Note', midi={0x91,0x3E,MIDI_LSB}},
				{name='Pad 3', label='PAD 3', objectType='Drumpad', midiType='Note', midi={0x91,0x40,MIDI_LSB}}
								
			}
		}
end
