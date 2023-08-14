num_row = {104,105,106,107,108,109,110,111}

abc_col = {8,24,40,56,72,88,104,120}

matrix = {
	{  0,  1,  2,  3,  4,  5,  6,  7},
	{ 16, 17, 18, 19, 20, 21, 22, 23},
	{ 32, 33, 34, 35, 36, 37, 38, 39},
	{ 48, 49, 50, 51, 52, 53, 54, 55},
	{ 64, 65, 66, 67, 68, 69, 70, 71},
	{ 80, 81, 82, 83, 84, 85, 86, 87},
	{ 96, 97, 98, 99,100,101,102,103},
	{112,113,114,115,116,117,118,119}
}

grid_items = {}

--function controller_midi_out(midiEvent,name,valueString,color)
--	if midiEvent then
--		print(midiEvent, name)
--	end
--end

function create_midi_object(value, objectType)
	if objectType == 'Button Press' then
		object = {name='Button ' .. value, label='Num Button ' .. value, objectType='Button', midiType='Press', midi={0xB0,value,MIDI_LSB}, outport='Launchpad Mini'}
		table.insert(grid_items, object)
	end
	
	if objectType == 'Button Single' then
		object = {name='Button ' .. value, label='ABC Button ' .. value, objectType='Button', midiType='Single', midi={0x90,value,MIDI_LSB}, outport='Launchpad Mini'}
		table.insert(grid_items, object)
	end

	if objectType == 'Grid' then
		object = {name='Button ' .. value, label='Grid Button ' .. value, objectType='Drumpad', midiType='Note', midi={0x90,value,MIDI_LSB}, outport='Launchpad Mini'}
		table.insert(grid_items, object)
	end
end

function get_grid_items()
	
	object = {name='Keyboard', label='Launchpad Mini', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=64, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}, outport='Launchpad Mini'}
	
	table.insert(grid_items, object)
	
	for r, c in pairs(matrix) do
		for i, value in pairs(c) do
			create_midi_object(value, 'Grid')
		end
	end

	for j, k in pairs(num_row) do
		create_midi_object(k, 'Button Press')
	end

	for l, m in pairs(abc_col) do
		create_midi_object(m, 'Button Single')
	end

	return grid_items
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	new_items = get_grid_items()
--	print(new_items)
	return {
		-- model name for this device
		model = 'Launchpad Mini',
		-- manufacturer name for this device
		manufacturer = 'Focusrite A.E. Ltd',
		
		-- Do not load into GB or Logic, because <rdar://problem/58990417> Launchpad Mini is supported by outdated LUA script (script should support MainStage only)
		garageband = false,
		logicprox = false,

		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = new_items
	}
end