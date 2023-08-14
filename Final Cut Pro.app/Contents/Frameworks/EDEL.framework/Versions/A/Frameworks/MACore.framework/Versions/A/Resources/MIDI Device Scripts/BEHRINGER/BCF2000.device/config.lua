-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'BCF2000',
		-- manufacturer name for this device
		manufacturer = 'Behringer',

		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Sustain Pedal', label='Switch', objectType='Sustain Pedal', midiType='Alternating', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Expression Pedal', label='Controller', objectType='Pedal', midi={0xB0,0x5E,MIDI_LSB}},

				{name='Fader 1', objectType='VFader', midi={0xB0,0x51,MIDI_LSB}, outport='Port 1'},
				{name='Fader 2', objectType='VFader', midi={0xB0,0x52,MIDI_LSB}, outport='Port 1'},
				{name='Fader 3', objectType='VFader', midi={0xB0,0x53,MIDI_LSB}, outport='Port 1'},
				{name='Fader 4', objectType='VFader', midi={0xB0,0x54,MIDI_LSB}, outport='Port 1'},
				{name='Fader 5', objectType='VFader', midi={0xB0,0x55,MIDI_LSB}, outport='Port 1'},
				{name='Fader 6', objectType='VFader', midi={0xB0,0x56,MIDI_LSB}, outport='Port 1'},
				{name='Fader 7', objectType='VFader', midi={0xB0,0x57,MIDI_LSB}, outport='Port 1'},
				{name='Fader 8', objectType='VFader', midi={0xB0,0x58,MIDI_LSB}, outport='Port 1'},

				{name='Knob 1', objectType='Knob', midi={0xB0,0x01,MIDI_LSB}, outport='Port 1'},
				{name='Knob 2', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}, outport='Port 1'},
				{name='Knob 3', objectType='Knob', midi={0xB0,0x03,MIDI_LSB}, outport='Port 1'},
				{name='Knob 4', objectType='Knob', midi={0xB0,0x04,MIDI_LSB}, outport='Port 1'},
				{name='Knob 5', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}, outport='Port 1'},
				{name='Knob 6', objectType='Knob', midi={0xB0,0x06,MIDI_LSB}, outport='Port 1'},
				{name='Knob 7', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}, outport='Port 1'},
				{name='Knob 8', objectType='Knob', midi={0xB0,0x08,MIDI_LSB}, outport='Port 1'},

				{name='Button A', objectType='Button', midiType='Alternating', midi={0xB0,0x59,MIDI_LSB}, outport='Port 1'},
				{name='Button B', objectType='Button', midiType='Alternating', midi={0xB0,0x5A,MIDI_LSB}, outport='Port 1'},
				{name='Button C', objectType='Button', midiType='Alternating', midi={0xB0,0x5B,MIDI_LSB}, outport='Port 1'},
				{name='Button D', objectType='Button', midiType='Alternating', midi={0xB0,0x5C,MIDI_LSB}, outport='Port 1'},

				{name='Button 1a', objectType='Button', midiType='Alternating', midi={0xB0,0x41,MIDI_LSB}, outport='Port 1'},
				{name='Button 2a', objectType='Button', midiType='Alternating', midi={0xB0,0x42,MIDI_LSB}, outport='Port 1'},
				{name='Button 3a', objectType='Button', midiType='Alternating', midi={0xB0,0x43,MIDI_LSB}, outport='Port 1'},
				{name='Button 4a', objectType='Button', midiType='Alternating', midi={0xB0,0x44,MIDI_LSB}, outport='Port 1'},
				{name='Button 5a', objectType='Button', midiType='Alternating', midi={0xB0,0x45,MIDI_LSB}, outport='Port 1'},
				{name='Button 6a', objectType='Button', midiType='Alternating', midi={0xB0,0x46,MIDI_LSB}, outport='Port 1'},
				{name='Button 7a', objectType='Button', midiType='Alternating', midi={0xB0,0x47,MIDI_LSB}, outport='Port 1'},
				{name='Button 8a', objectType='Button', midiType='Alternating', midi={0xB0,0x48,MIDI_LSB}, outport='Port 1'},

				{name='Button 1b', objectType='Button', midiType='Alternating', midi={0xB0,0x49,MIDI_LSB}, outport='Port 1'},
				{name='Button 2b', objectType='Button', midiType='Alternating', midi={0xB0,0x4A,MIDI_LSB}, outport='Port 1'},
				{name='Button 3b', objectType='Button', midiType='Alternating', midi={0xB0,0x4B,MIDI_LSB}, outport='Port 1'},
				{name='Button 4b', objectType='Button', midiType='Alternating', midi={0xB0,0x4C,MIDI_LSB}, outport='Port 1'},
				{name='Button 5b', objectType='Button', midiType='Alternating', midi={0xB0,0x4D,MIDI_LSB}, outport='Port 1'},
				{name='Button 6b', objectType='Button', midiType='Alternating', midi={0xB0,0x4E,MIDI_LSB}, outport='Port 1'},
				{name='Button 7b', objectType='Button', midiType='Alternating', midi={0xB0,0x4F,MIDI_LSB}, outport='Port 1'},
				{name='Button 8b', objectType='Button', midiType='Alternating', midi={0xB0,0x50,MIDI_LSB}, outport='Port 1'},
			}
		}
end
