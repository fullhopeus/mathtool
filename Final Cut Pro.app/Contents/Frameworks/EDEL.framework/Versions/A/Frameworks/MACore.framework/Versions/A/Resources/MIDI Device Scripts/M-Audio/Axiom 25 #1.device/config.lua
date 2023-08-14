-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		-- script refers to M-Audio Axiom 25 2nd generation
		model = 'Axiom 25',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- USB information to check for the 2nd generation Axiom 25
		usb_vendor_id = 1891,	-- M-Audio
		usb_product_id = 8236,	-- Axiom 25 2nd generation
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x01,0x05,0x63,0x0E,0x2C,0x50,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='A18', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='A19', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Axiom 25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
				{name='Channel Pressure', objectType='Wheel', midi={0xD0,MIDI_LSB}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Expression Pedal', label='Expr', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}},

				{name='Fader 1', label='Volume', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}},
				
				{name='Knob 1', label='E1', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 2', label='E2', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 3', label='E3', objectType='Knob', midi={0xB0,0x5B,MIDI_LSB}},
				{name='Knob 4', label='E4', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 5', label='E5', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 6', label='E6', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 7', label='E7', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 8', label='E8', objectType='Knob', midi={0xB0,0x54,MIDI_LSB}},

				{name='LOOP', label='E9', objectType='Button', midiType='Momentary', midi={0xBF,0x71,MIDI_LSB}},
				{name='REWIND', label='E10', objectType='Button', midiType='Momentary', midi={0xBF,0x72,MIDI_LSB}},
				{name='FORWARD', label='E11', objectType='Button', midiType='Momentary', midi={0xBF,0x73,MIDI_LSB}},
				{name='STOP', label='E12', objectType='Button', midiType='Momentary', midi={0xBF,0x74,MIDI_LSB}},
				{name='PLAY', label='E13', objectType='Button', midiType='Momentary', midi={0xBF,0x75,MIDI_LSB}},
				{name='RECORD', label='E14', objectType='Button', midiType='Momentary', midi={0xBF,0x76,MIDI_LSB}},

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
