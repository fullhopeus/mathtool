-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Oxygen 25 mkIV',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',

		preset_name = 'Preset 1 - Channel 1 - Program 00',

		-- USB information to check for the 2nd generation Oxygen 25
		usb_vendor_id = 1891,	-- M-Audio
		usb_product_id = 12545,	-- Oxygen 25 mkIV

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='C15', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='C16', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Oxygen 25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='C18', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Volume', label='Volume', objectType='Knob', midi={0xB0,0x14,MIDI_LSB}},

				{name='Knob 1', label='C1', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 2', label='C2', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 3', label='C3', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 4', label='C4', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 5', label='C5', objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},
				{name='Knob 6', label='C6', objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},
				{name='Knob 7', label='C7', objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Knob 8', label='C8', objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
                                
				{name='LOOP', label='C11', objectType='Button', midiType='Momentary', midi={0xB0,0x71,MIDI_LSB}},
				{name='STOP', label='C12', objectType='Button', midiType='Momentary', midi={0xB0,0x74,MIDI_LSB}},
				{name='PLAY', label='C13', objectType='Button', midiType='Momentary', midi={0xB0,0x75,MIDI_LSB}},
				{name='RECORD', label='C14', objectType='Button', midiType='Momentary', midi={0xB0,0x76,MIDI_LSB}},

				{name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}},
				{name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}},
				{name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}},
				{name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}},
				{name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}},
				{name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}},
				{name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}},
				{name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}},
			}
		}
end
