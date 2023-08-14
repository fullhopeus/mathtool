knob_matrix = {
	{17,16, 9, 8},
	{19,18,11,10},
	{21,20,13,12}
}

fader_row_left = {23,22,15,14}

button_row_left = {65,73,66,74}

grid_matrix = {
 	{ 0,  8, 16, 24, 32, 40, 48, 56},
 	{ 1,  9, 17, 25, 33, 41, 49, 57},
 	{ 2, 10, 18, 26, 34, 42, 50, 58},
 	{ 3, 11, 19, 27, 35, 43, 51, 59},
 	{ 4, 12, 20, 28, 36, 44, 52, 60},
 	{ 5, 13, 21, 29, 37, 45, 53, 61},
 	{ 6, 14, 22, 30, 38, 46, 54, 62},
 	{ 7, 15, 23, 31, 39, 47, 55, 63}
}

xfader_button_left = 64
xfader = 24
xfader_button_right = 72

three_by_six_button_matrix = {
	{69, 70, 71},
	{77, 78, 79}
}

livid_button = 87
knob_row_right = {3,1,0,2}
fader_row_right = {5,7,6}
button_row_right = {67,75,68,76}

master_volume = 4

grid_items = {}

function matrix_table(value, type)
	if type == 'Grid' then
		new_table = {name='Button '..value, label='OhmRGB Grid Cell '..value, objectType='Drumpad', midiType='Note', midi={0x90,value,MIDI_LSB}, outport='Controls'}
		return new_table	
	end
	if type == 'Slider' then
		new_table = {name='Slider '..value, label='Slider '..value, objectType='VFader', midi={0xB0,value,MIDI_LSB}}
		return new_table	
	end
	if type == 'Knob' then
		new_table = {name='Knob '..value, label='Knob '..value, objectType='Knob', midi={0xB0,value,MIDI_LSB}}
		return new_table
	end
	if type == 'Button' then
		new_table = {name='Button '..value, label='Button '..value, objectType='Button', midi={0x90,value,MIDI_LSB}, outport='Controls'}
		return new_table
	end
end 

function get_grid_items()
	object = {name='Keyboard', label='OhmRGB', objectType='Keyboard', midiType='Keyboard', startKey=0, numberKeys=64, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}}
	table.insert(grid_items, object)
	object = {name='Volume', label='Volume', objectType='VFader', midi={0xB0,master_volume,MIDI_LSB}}
	table.insert(grid_items, object)

	-- Create Upper Right Hand Knob Matrix
	for r, c in pairs(knob_matrix) do
		for i, value in pairs(c) do
			table.insert(grid_items, matrix_table(value, 'Knob'))
		end
	end
	-- Create Fader Row Left
	for r, c in pairs(fader_row_left) do
		table.insert(grid_items, matrix_table(c, 'Slider'))
	end
	-- Create Button Row Left
	for r, c in pairs(button_row_left) do
		table.insert(grid_items, matrix_table(c, 'Button'))
	end
	-- Create Grid / Matrix
	for r, c in pairs(grid_matrix) do
		for i, value in pairs(c) do
			table.insert(grid_items, matrix_table(value, 'Grid'))
		end
	end
	table.insert(grid_items, {name='XFader Button L', label='XFader Button L', objectType='Button', midi={0x90,xfader_button_left,MIDI_LSB}, outport='Controls'} )
	table.insert(grid_items, {name='XFader', label='XFader', objectType='HFader', midi={0xB0,xfader,MIDI_LSB}} )
	table.insert(grid_items, {name='XFader Button R', label='XFader Button R', objectType='Button', midi={0x90,xfader_button_right,MIDI_LSB}, outport='Controls'} )
	for r, c in pairs(three_by_six_button_matrix) do
		for i, value in pairs(c) do
			table.insert(grid_items, matrix_table(value, 'Button'))
		end
	end
	table.insert(grid_items, {name='Livid Button', label='Livid Button', objectType='Button', midi={0x90,livid_button,MIDI_LSB}, outport='Controls'} )
	-- Create Fader Row Right
	for r, c in pairs(fader_row_right) do
		table.insert(grid_items, matrix_table(c, 'Slider'))
	end
	-- Create Button Row Right
	for r, c in pairs(button_row_right) do
		table.insert(grid_items, matrix_table(c, 'Button'))
	end

	return grid_items
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	new_items = get_grid_items()
	return {
		-- model name for this device
		model = 'OhmRGB',
		-- manufacturer name for this device
		manufacturer = 'Livid Instruments, Inc.',
		-- Certain controllers are passed through automatically (Pitch Bend, Modulation, etc)
		auto_passthrough = false,
		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = new_items
	}
end