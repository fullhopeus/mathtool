-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if midiEvent[0] == 0xC0 then
		-- convert program change into a switch
		return {midi={0xB0,midiEvent[1] + 102,0x7F}}
	end
	return nil
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'O2',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Preset 1',

		-- Response to the 'Universal Device Inquiry' message F0 7E 7F 06 01 F7
		-- If defined, this is used to check if the device is matching this one.
		device_inquiry = {0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x63,0x0E,0x15,0x02,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='C10', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='C11', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='O2', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=24, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Volume', label='Volume', objectType='Knob', midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1', label='C1', objectType='Knob', midi={0xB0,0x49,MIDI_LSB}},
				{name='Knob 2', label='C2', objectType='Knob', midi={0xB0,0x48,MIDI_LSB}},
				{name='Knob 3', label='C3', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Knob 4', label='C4', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 5', label='C5', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}},
				{name='Knob 6', label='C6', objectType='Knob', midi={0xB0,0x54,MIDI_LSB}},
				{name='Knob 7', label='C7', objectType='Knob', midi={0xB0,0x5D,MIDI_LSB}},
				{name='Knob 8', label='C8', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}},

				{name='Button 1', label='C12', objectType='Button', midiType='Single', midi={0xB0,102,MIDI_LSB}},
				{name='Button 2', label='C13', objectType='Button', midiType='Single', midi={0xB0,103,MIDI_LSB}},
				{name='Button 3', label='C14', objectType='Button', midiType='Single', midi={0xB0,104,MIDI_LSB}},
				{name='Button 4', label='C15', objectType='Button', midiType='Single', midi={0xB0,105,MIDI_LSB}},
				{name='Button 5', label='C16', objectType='Button', midiType='Single', midi={0xB0,106,MIDI_LSB}},
				{name='Button 6', label='C17', objectType='Button', midiType='Single', midi={0xB0,107,MIDI_LSB}},
				{name='Button 7', label='C18', objectType='Button', midiType='Single', midi={0xB0,108,MIDI_LSB}},
				{name='Button 8', label='C19', objectType='Button', midiType='Single', midi={0xB0,109,MIDI_LSB}},
			}
		}
end
