-- Return the list of valid controllers
function controller_names(channel)
	if channel == 0 then
		return {
				[0x01] = 'X-Y Pad X', 
				[0x02] = 'X-Y Pad Y', 
				[0x10] = 'X-Y Pad touched', 
				}
	else
		return nil
	end
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'nanoPAD2',
		-- manufacturer name for this device
		manufacturer = 'Korg',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Scene 1',

        -- The KORG nanoPAD2 does not support controlling the LEDs
        supports_feedback = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				{name='Keyboard', label='nanoPAD2', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=16, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='X-Y Pad X', label='X', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='X-Y Pad Y', label='Volume', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}},
				{name='X-Y Pad touched', label='X-Y Pad touched', objectType='Momentary', midi={0xB0,0x10,MIDI_LSB}},
				-- Pad Row 1 Col 1
				{name='Pad 1', label='1', objectType='Drumpad', midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				{name='Pad 2', label='2', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},
				{name='Pad 3', label='3', objectType='Drumpad', midiType='Note', midi={0x90,0x29,MIDI_LSB}},
				{name='Pad 4', label='4', objectType='Drumpad', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},
				-- Pad Row 1 Col 2
				{name='Pad 5', label='5', objectType='Drumpad', midiType='Note', midi={0x90,0x2D,MIDI_LSB}},
				{name='Pad 6', label='6', objectType='Drumpad', midiType='Note', midi={0x90,0x2F,MIDI_LSB}},
				{name='Pad 7', label='7', objectType='Drumpad', midiType='Note', midi={0x90,0x31,MIDI_LSB}},
				{name='Pad 8', label='8', objectType='Drumpad', midiType='Note', midi={0x90,0x33,MIDI_LSB}},
				-- Pad Row 2 Col 1
				{name='Pad 9', label='9', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				{name='Pad 10', label='10', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				{name='Pad 11', label='11', objectType='Drumpad', midiType='Note', midi={0x90,0x28,MIDI_LSB}},
				{name='Pad 12', label='12', objectType='Drumpad', midiType='Note', midi={0x90,0x2A,MIDI_LSB}},
				-- Pad Row 2 Col 2
				{name='Pad 13', label='13', objectType='Drumpad', midiType='Note', midi={0x90,0x2C,MIDI_LSB}},
				{name='Pad 14', label='114', objectType='Drumpad', midiType='Note', midi={0x90,0x2E,MIDI_LSB}},
				{name='Pad 15', label='15', objectType='Drumpad', midiType='Note', midi={0x90,0x30,MIDI_LSB}},
				{name='Pad 16', label='16', objectType='Drumpad', midiType='Note', midi={0x90,0x32,MIDI_LSB}},
			}
		}
end
