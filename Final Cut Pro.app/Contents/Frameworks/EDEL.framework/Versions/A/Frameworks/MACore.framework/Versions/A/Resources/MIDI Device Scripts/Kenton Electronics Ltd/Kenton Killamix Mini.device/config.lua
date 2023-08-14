-- Return the list of valid controllers
function controller_names(channel)
	if channel == 0 then
		return {
				 [0x01] = 'Knob 1',
		  		 [0x02] = 'Knob 2',
		  		 [0x03] = 'Knob 3',
		  		 [0x04] = 'Knob 4',
		  		 [0x05] = 'Knob 5',
		  		 [0x06] = 'Knob 6',
				 [0x07] = 'Knob 7',
		  		 [0x08] = 'Knob 8',
		  		 [0x09] = 'Knob 9',

		  		 [0x13] = 'Joystick X',
		  		 [0x14] = 'Joystick Y',

				 [0x0A] = 'Button 1',
		  		 [0x0B] = 'Button 2',
		  		 [0x0C] = 'Button 3',
		  		 [0x0D] = 'Button 4',
		  		 [0x0E] = 'Button 5',
		  		 [0x0F] = 'Button 6',
				 [0x10] = 'Button 7',
		  		 [0x11] = 'Button 8',
		  		 [0x12] = 'Button 9',
				}
	else
		return {}
	end
end

-- Return the list of valid controllers
function controller_note_names(channel)
	return {}
end

function controller_midi_in(midiEvent,portName)
	return nil	-- allow all other events
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Killamix mini',
		-- manufacturer name for this device
		manufacturer = 'Kenton Electronics Ltd',

		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Volume', objectType='Knob', midi={0xB0,0x09,MIDI_LSB}, outport=''},

				{name='Knob 1', objectType='Knob', midi={0xB0,0x01,MIDI_LSB}, outport=''},
				{name='Knob 2', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}, outport=''},
				{name='Knob 3', objectType='Knob', midi={0xB0,0x03,MIDI_LSB}, outport=''},
				{name='Knob 4', objectType='Knob', midi={0xB0,0x04,MIDI_LSB}, outport=''},
				{name='Knob 5', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}, outport=''},
				{name='Knob 6', objectType='Knob', midi={0xB0,0x06,MIDI_LSB}, outport=''},
				{name='Knob 7', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}, outport=''},
				{name='Knob 8', objectType='Knob', midi={0xB0,0x08,MIDI_LSB}, outport=''},

				{name='Joystick X', objectType='Wheel', midi={0xB0,0x13,MIDI_LSB}},
				{name='Joystick Y', objectType='Wheel', midi={0xB0,0x14,MIDI_LSB}},

				{name='Button 1', objectType='Button', midiType='Single', midi={0xB0,0x0A,MIDI_LSB}, outport=''},
				{name='Button 2', objectType='Button', midiType='Single', midi={0xB0,0x0B,MIDI_LSB}, outport=''},
				{name='Button 3', objectType='Button', midiType='Single', midi={0xB0,0x0C,MIDI_LSB}, outport=''},
				{name='Button 4', objectType='Button', midiType='Single', midi={0xB0,0x0D,MIDI_LSB}, outport=''},
				{name='Button 5', objectType='Button', midiType='Single', midi={0xB0,0x0E,MIDI_LSB}, outport=''},
				{name='Button 6', objectType='Button', midiType='Single', midi={0xB0,0x0F,MIDI_LSB}, outport=''},
				{name='Button 7', objectType='Button', midiType='Single', midi={0xB0,0x10,MIDI_LSB}, outport=''},
				{name='Button 8', objectType='Button', midiType='Single', midi={0xB0,0x11,MIDI_LSB}, outport=''},
				{name='Button 9', objectType='Button', midiType='Single', midi={0xB0,0x12,MIDI_LSB}, outport=''},
		}
	}
end
