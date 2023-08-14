-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if portName == 'EDIROL PCR MIDI IN' then
		return nil
	end
	return {midi=midiEvent,inport='EDIROL PCR 1'}	-- always receive on the first port
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'EDIROL PCR-M80',
		-- manufacturer name for this device
		manufacturer = 'Roland',
		-- a string for the UI that explains if a certain preset/scene/patch has to be selected on the device
		preset_name = 'Generic Driver Mode - Control Map 0',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Keyboard', label='EDIROL PCR', objectType='Keyboard', midiType='Keyboard', startKey=36, numberKeys=61, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}, inport='EDIROL PCR 1'},

				{name='Sustain Pedal', label='Hold', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Expression Pedal', label='Expression', objectType='Pedal', midi={0xB0,0x0B,MIDI_LSB}, inport='EDIROL PCR 1'},

				{name='Fader 9', label='Volume', objectType='VFader', midi={0xB1,0x12,MIDI_LSB}, inport='EDIROL PCR 1'},

				{name='Knob 1', label='R1', objectType='Knob', midi={0xB0,0x10,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Knob 2', label='R2', objectType='Knob', midi={0xB1,0x10,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Knob 3', label='R3', objectType='Knob', midi={0xB2,0x10,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Knob 4', label='R4', objectType='Knob', midi={0xB3,0x10,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Knob 5', label='R5', objectType='Knob', midi={0xB4,0x10,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Knob 6', label='R6', objectType='Knob', midi={0xB5,0x10,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Knob 7', label='R7', objectType='Knob', midi={0xB6,0x10,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Knob 8', label='R8', objectType='Knob', midi={0xB7,0x10,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Knob 9', label='R9', objectType='Knob', midi={0xB0,0x12,MIDI_LSB}, inport='EDIROL PCR 1'},
                                                                            
				{name='Fader 1', label='S1', objectType='VFader', midi={0xB0,0x11,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Fader 2', label='S2', objectType='VFader', midi={0xB1,0x11,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Fader 3', label='S3', objectType='VFader', midi={0xB2,0x11,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Fader 4', label='S4', objectType='VFader', midi={0xB3,0x11,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Fader 5', label='S5', objectType='VFader', midi={0xB4,0x11,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Fader 6', label='S6', objectType='VFader', midi={0xB5,0x11,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Fader 7', label='S7', objectType='VFader', midi={0xB6,0x11,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Fader 8', label='S8', objectType='VFader', midi={0xB7,0x11,MIDI_LSB}, inport='EDIROL PCR 1'},

				{name='Horizontal Fader', label='H1', objectType='VFader', midi={0xB0,0x13,MIDI_LSB}, inport='EDIROL PCR 1'},

				{name='Pad A1', label='A1', objectType='Button', midiType='Momentary', midi={0xB0,0x50,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad A2', label='A2', objectType='Button', midiType='Momentary', midi={0xB1,0x50,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad A3', label='A3', objectType='Button', midiType='Momentary', midi={0xB2,0x50,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad A4', label='A4', objectType='Button', midiType='Momentary', midi={0xB3,0x50,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad A5', label='A5', objectType='Button', midiType='Momentary', midi={0xB4,0x50,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad A6', label='A6', objectType='Button', midiType='Momentary', midi={0xB5,0x50,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad A7', label='A7', objectType='Button', midiType='Momentary', midi={0xB6,0x50,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad A8', label='A8', objectType='Button', midiType='Momentary', midi={0xB7,0x50,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad A9', label='A9', objectType='Button', midiType='Momentary', midi={0xB0,0x53,MIDI_LSB}, inport='EDIROL PCR 1'},

				{name='Pad B1', label='B1', objectType='Button', midiType='Momentary', midi={0xB0,0x51,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad B2', label='B2', objectType='Button', midiType='Momentary', midi={0xB1,0x51,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad B3', label='B3', objectType='Button', midiType='Momentary', midi={0xB2,0x51,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad B4', label='B4', objectType='Button', midiType='Momentary', midi={0xB3,0x51,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad B5', label='B5', objectType='Button', midiType='Momentary', midi={0xB4,0x51,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad B6', label='B6', objectType='Button', midiType='Momentary', midi={0xB5,0x51,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad B7', label='B7', objectType='Button', midiType='Momentary', midi={0xB6,0x51,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad B8', label='B8', objectType='Button', midiType='Momentary', midi={0xB7,0x51,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Pad B9', label='B9', objectType='Button', midiType='Momentary', midi={0xB1,0x53,MIDI_LSB}, inport='EDIROL PCR 1'},

				{name='Button C1', label='C1', objectType='Button', midiType='Momentary', midi={0xB0,0x52,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Button C2', label='C2', objectType='Button', midiType='Momentary', midi={0xB1,0x52,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Button C3', label='C3', objectType='Button', midiType='Momentary', midi={0xB2,0x52,MIDI_LSB}, inport='EDIROL PCR 1'},

				{name='Rewind', label='L1', objectType='Button', midiType='Momentary', midi={0xB8,0x52,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Stop', label='L2', objectType='Button', midiType='Momentary', midi={0xBE,0x52,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Play', label='L3', objectType='Button', midiType='Momentary', midi={0xBF,0x52,MIDI_LSB}, inport='EDIROL PCR 1'},
				{name='Record', label='L4', objectType='Button', midiType='Momentary', midi={0xBA,0x52,MIDI_LSB}, inport='EDIROL PCR 1'},
		}
	}
end
