matrix = {
	{  0,  1,  2,  3,  4,  5,  6,  7 },
	{  8,  9, 10, 11, 12, 13, 14, 15 },
	{ 16, 17, 18, 19, 20, 21, 22, 23 },
	{ 24, 25, 26, 27, 28, 29, 30, 31 },
	{ 32, 33, 34, 35, 36, 37, 38, 39 },
	{ 40, 41, 42, 43, 44, 45, 46, 47 },
	{ 48, 49, 50, 51, 52, 53, 54, 55 },
	{ 56, 57, 58, 59, 60, 61, 62, 63 },
}
grid_items = {}

--function controller_midi_out(midiEvent,name,valueString,color)
--	if midiEvent then
--		print(midiEvent, name)
--	end
--end

function create_midi_object(value, objectType)
	if objectType == 'Grid' then
		object = {name='Button ' .. value, label='Grid Button ' .. value, objectType='Drumpad', midiType='Note', midi={0x90,value,MIDI_LSB}, outport='Monome 64'}
		table.insert(grid_items, object)
	end
end

function get_grid_items()
	
	object = {name='Keyboard', label='Monome', objectType='Keyboard', midiType='Keyboard', startKey=0, numberKeys=64, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}, outport='Monome 64'}
	
	table.insert(grid_items, object)
	
	for r, c in pairs(matrix) do
		for i, value in pairs(c) do
			create_midi_object(value, 'Grid')
		end
	end

	return grid_items
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	new_items = get_grid_items()
	return {
		-- model name for this device
		model = 'Monome 64',
		-- manufacturer name for this device
		manufacturer = 'Monome',
		
		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = new_items
	}
end
