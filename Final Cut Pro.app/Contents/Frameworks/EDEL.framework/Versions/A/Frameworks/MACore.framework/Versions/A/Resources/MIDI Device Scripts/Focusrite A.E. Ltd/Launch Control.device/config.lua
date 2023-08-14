grid_items = {}

knb_array = {
	{ 21, 22, 23, 24, 25, 26, 27, 28 },
	{ 41, 42, 43, 44, 45, 46, 47 }
}

btn_row = { 9, 10, 11, 12, 25, 26, 27, 28 }

arrow_btn = { 114, 115, 116, 117 }

function controller_initialize(applicationName,deviceNewlyDetected)
--	if deviceNewlyDetected then
		return {midi={0xF0,0x00,0x20,0x29,0x02,0x0A,0x77,0x08,0xF7}, outport='Launch Control'}
--	else
--		return {midi={0xF0,0x00,0x20,0x29,0x02,0x0A,0x77,0x08,0xF7}, outport='Launch Control'}
--	end
end

function create_midi_object(value, objectType)
	
	if objectType == 'Knobs' then
		object = {name='Knob', label='Knob', objectType='Knob', midi={0xB8,value,MIDI_LSB}}
		table.insert(grid_items, object)
	end
	
	if objectType == 'Button Note' then
		object = {name='Button' , label='Button', objectType='Button', midiType='Note', midi={0x98,value,MIDI_LSB}, outport='Launch Control'}
		table.insert(grid_items, object)
	end

	if objectType == 'Button CC' then
		object = {name='Button', label='Arrow Button', objectType='Button', midiType='Momentary', midi={0xB8,value,MIDI_LSB}, outport='Launch Control'}
		table.insert(grid_items, object)
	end
end

function get_grid_items()

	object = {name='Volume', label='Volume', objectType='Knob', midi={0xB8,48,MIDI_LSB}}
	
	table.insert(grid_items, object)
			
	for r, c in pairs(knb_array) do
		for i, value in pairs(c) do
			create_midi_object(value, 'Knobs')
		end
	end

	for btn = 1, 8 do
		create_midi_object(btn_row[btn], 'Button Note')
	end

	for btncc = 1, 4 do
		create_midi_object(arrow_btn[btncc], 'Button CC')
	end

	return grid_items
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()

	return {
		-- model name for this device
		model = 'Launch Control',
		-- manufacturer name for this device
		manufacturer = 'Focusrite A.E. Ltd',
		
		preset_name = 'Factory',
		-- Automatically Set Factory Mode 
		
		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,
				
		device_request = { 0xF0,0x00,0x20,0x29,0x02,0x0A,0x77,0x08,0xF7 },

		device_inquiry = { 0xF0,0x7E,0x7F,0x06,0x02,0x00,0x20,0x08,0x63,0x0E,0x17,0x02,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,MIDI_Wildcard,0xF7},

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = get_grid_items()
	}
end