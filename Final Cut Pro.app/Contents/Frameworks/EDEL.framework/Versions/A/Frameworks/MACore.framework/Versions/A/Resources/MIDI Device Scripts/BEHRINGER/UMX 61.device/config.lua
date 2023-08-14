-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'UMX 61',
		-- manufacturer name for this device
		manufacturer = 'Behringer',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='PITCH BEND', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='MODULATION', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='UMX 61', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=61, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Volume', label='VOLUME', objectType='Volume', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1', label='R1', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 2', label='R2', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 3', label='R3', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 4', label='R4', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},

				{name='Button 1', label='B1', objectType='Button', midiType='Alternating', midi={0xB0,0x61,MIDI_LSB}},
				{name='Button 2', label='B2', objectType='Button', midiType='Alternating', midi={0xB0,0x60,MIDI_LSB}},
				{name='Button 3', label='B3', objectType='Button', midiType='Alternating', midi={0xB0,0x42,MIDI_LSB}},
				{name='Button 4', label='B4', objectType='Button', midiType='Alternating', midi={0xB0,0x43,MIDI_LSB}},
				{name='Button 5', label='B5', objectType='Button', midiType='Alternating', midi={0xB0,0x40,MIDI_LSB}},
				{name='Button 6', label='B6', objectType='Button', midiType='Alternating', midi={0xB0,0x41,MIDI_LSB}},
				{name='Button 7', label='B7', objectType='Button', midiType='Single', midi={0xB0,0x07,MIDI_LSB}},
				{name='Button 8', label='B8', objectType='Button', midiType='Single', midi={0xB0,0x0A,MIDI_LSB}},

				{name='Knob 5', label='R5', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 6', label='R6', objectType='Knob', midi={0xB0,0x4B,MIDI_LSB}},
				{name='Knob 7', label='R7', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 8', label='R8', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},
			}
		}
end
