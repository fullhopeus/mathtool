-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if portName == 'A-Series Keyboard' then
		return nil
	end
	return {midi=midiEvent,inport='A-Series Keyboard'}	-- always receive on the first port
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'A-Series Keyboard',
		-- manufacturer name for this device
		manufacturer = 'Roland',
		
		preset_name = 'MIDI CH 1',

		inport_name = 'A-Series Keyboard',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}, inport=inport_name},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}, inport=inport_name},
				{name='Keyboard', label=inport_name, objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=61, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}, inport=inport_name},

				{name='Sustain Pedal', label='Hold', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}, inport=inport_name},
				{name='Expression Pedal', label='Expression', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}, inport=inport_name},				

				{name='Volume', label='Volume', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}},
				{name='Knob 2', label='R2', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}},                                                                            
		}
	}
end