-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if portName == 'A-PRO MIDI IN' then
		return nil
	end
	return {midi=midiEvent,inport='A-PRO 1'}	-- always receive on the first port
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Cakewalk A-PRO',
		replacingPlugInModel = 'A-PRO', -- this will associate the Lua script to the A-PRO plug-in. As there are no assignments, PreferPlugIn() will still return true
		-- manufacturer name for this device
		manufacturer = 'Roland',
		
		preset_name = 'MIDI CH 1',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}, inport='A-PRO 1'},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}, inport='A-PRO 1'},
				{name='Keyboard', label='A-PRO 1', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=61, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}, inport='A-PRO 1'},

				{name='Sustain Pedal', label='Hold', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}, inport='A-PRO 1'},
				{name='Expression Pedal', label='Expression', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}, inport='A-PRO 1'},

				{name='Fader 9', label='Volume', objectType='VFader', midi={0xB0,0x07,MIDI_LSB}, inport='A-PRO 1'},

				{name='Knob 1', label='R1', objectType='Knob', midi={0xB0,0x4A,MIDI_LSB}, inport='A-PRO 1'},
				{name='Knob 2', label='R2', objectType='Knob', midi={0xB0,0x47,MIDI_LSB}, inport='A-PRO 1'},
				{name='Knob 3', label='R3', objectType='Knob', midi={0xB0,0x41,MIDI_LSB}, inport='A-PRO 1'},
				{name='Knob 4', label='R4', objectType='Knob', midi={0xB0,0x02,MIDI_LSB}, inport='A-PRO 1'},
				{name='Knob 5', label='R5', objectType='Knob', midi={0xB0,0x05,MIDI_LSB}, inport='A-PRO 1'},
				{name='Knob 6', label='R6', objectType='Knob', midi={0xB0,0x4C,MIDI_LSB}, inport='A-PRO 1'},
				{name='Knob 7', label='R7', objectType='Knob', midi={0xB0,0x4D,MIDI_LSB}, inport='A-PRO 1'},
				{name='Knob 8', label='R8', objectType='Knob', midi={0xB0,0x4E,MIDI_LSB}, inport='A-PRO 1'},
				{name='Knob 9', label='R9', objectType='Knob', midi={0xB0,0x0A,MIDI_LSB}, inport='A-PRO 1'},
                                                                            
				{name='Fader 1', label='S1', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}, inport='A-PRO 1'},
				{name='Fader 2', label='S2', objectType='VFader', midi={0xB0,0x4B,MIDI_LSB}, inport='A-PRO 1'},
				{name='Fader 3', label='S3', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}, inport='A-PRO 1'},
				{name='Fader 4', label='S4', objectType='VFader', midi={0xB0,0x5B,MIDI_LSB}, inport='A-PRO 1'},
				{name='Fader 5', label='S5', objectType='VFader', midi={0xB0,0x5C,MIDI_LSB}, inport='A-PRO 1'},
				{name='Fader 6', label='S6', objectType='VFader', midi={0xB0,0x5D,MIDI_LSB}, inport='A-PRO 1'},
				{name='Fader 7', label='S7', objectType='VFader', midi={0xB0,0x5E,MIDI_LSB}, inport='A-PRO 1'},
				{name='Fader 8', label='S8', objectType='VFader', midi={0xB0,0x5F,MIDI_LSB}, inport='A-PRO 1'},

				{name='Start', label='L1', objectType='Button', midiType='Momentary', midi={0xB0,0x15,MIDI_LSB}, inport='A-PRO 1'},
				{name='Rewind', label='L2', objectType='Button', midiType='Momentary', midi={0xB0,0x16,MIDI_LSB}, inport='A-PRO 1'},
				{name='Forward', label='L3', objectType='Button', midiType='Momentary', midi={0xB0,0x17,MIDI_LSB}, inport='A-PRO 1'},
				{name='End', label='L4', objectType='Button', midiType='Momentary', midi={0xB0,0x18,MIDI_LSB}, inport='A-PRO 1'},
				{name='Stop', label='L5', objectType='Button', midiType='Momentary', midi={0xB0,0x19,MIDI_LSB}, inport='A-PRO 1'},
				{name='Play', label='L6', objectType='Button', midiType='Momentary', midi={0xB0,0x1A,MIDI_LSB}, inport='A-PRO 1'},
				{name='Pause', label='L7', objectType='Button', midiType='Momentary', midi={0xB0,0x1B,MIDI_LSB}, inport='A-PRO 1'},
				{name='Record', label='L8', objectType='Button', midiType='Momentary', midi={0xB0,0x1C,MIDI_LSB}, inport='A-PRO 1'},

				{name='Button 1', label='B1', objectType='Button', midiType='Toggle', midi={0xB0,0x50,MIDI_LSB}, inport='A-PRO 1'},
				{name='Button 2', label='B2', objectType='Button', midiType='Toggle', midi={0xB0,0x51,MIDI_LSB}, inport='A-PRO 1'},
				{name='Button 3', label='B3', objectType='Button', midiType='Toggle', midi={0xB0,0x52,MIDI_LSB}, inport='A-PRO 1'},
				{name='Button 4', label='B4', objectType='Button', midiType='Toggle', midi={0xB0,0x53,MIDI_LSB}, inport='A-PRO 1'},

				{name='Pad 1', label='A5', objectType='Drumpad', midiType='Note', midi={0x99,0x2B,MIDI_LSB}, inport='A-PRO 1'},
				{name='Pad 2', label='A6', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}, inport='A-PRO 1'},
				{name='Pad 3', label='A7', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}, inport='A-PRO 1'},
				{name='Pad 4', label='A8', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}, inport='A-PRO 1'},
				{name='Pad 5', label='A1', objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}, inport='A-PRO 1'},
				{name='Pad 6', label='A2', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}, inport='A-PRO 1'},
				{name='Pad 7', label='A3', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}, inport='A-PRO 1'},
				{name='Pad 8', label='A4', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}, inport='A-PRO 1'},

		}
	}
end