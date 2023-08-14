-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'LPK25',
		-- manufacturer name for this device
		manufacturer = 'Akai',

		-- Do not load into GB or Logic, because <rdar://problem/24657634> Lua script wants to assign controls on a keyboard without controls (Akai LPK25)
		garageband = false,
		logicprox = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Keyboard', label='LPK25', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=25, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},
			}
		}
end
