-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'USB Keystation 61es',
		-- manufacturer name for this device
		manufacturer = 'Evolution Electronics Ltd.',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='PITCH BEND', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='MODULATION', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='USB Keystation 61es', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=61, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Volume', label='VOLUME', objectType='Volume', midi={0xB0,0x07,MIDI_LSB}},
			}
		}
end
