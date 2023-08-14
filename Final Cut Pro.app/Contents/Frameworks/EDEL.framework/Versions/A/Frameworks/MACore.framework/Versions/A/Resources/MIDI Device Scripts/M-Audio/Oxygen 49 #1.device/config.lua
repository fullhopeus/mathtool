-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	if midiEvent[0] == 0xB0 and (midiEvent[1] == 0x00 or midiEvent[1] == 0x20) then
		return {}
	end
	if midiEvent[0] == 0xc0 then
		return {midi={0xB0,0x50+midiEvent[1],0x7F}}
	end
	return nil
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Oxygen 49 mkIV',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',
		
		preset_name = 'Preset 1 - Channel 1 - Program 00',
		
-- USB information to check for the 4th generation Oxygen 49
		usb_vendor_id = 1891,	-- M-Audio
		usb_product_id = 12546,	-- Oxygen 49 4th generation
		
		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='C31', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='C32', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				{name='Keyboard', label='Oxygen 49', objectType='Keyboard', midiType='Keyboard', startKey=48, numberKeys=49, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='C33', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				{name='Fader 9', label='Volume', objectType='VFader', midi={0xB0,0x3F,MIDI_LSB}},

				{name='Fader 1', label='C1', objectType='VFader', midi={0xB0,0x14,MIDI_LSB}},
				{name='Fader 2', label='C2', objectType='VFader', midi={0xB0,0x15,MIDI_LSB}},
				{name='Fader 3', label='C3', objectType='VFader', midi={0xB0,0x47,MIDI_LSB}},
				{name='Fader 4', label='C4', objectType='VFader', midi={0xB0,0x48,MIDI_LSB}},
				{name='Fader 5', label='C5', objectType='VFader', midi={0xB0,0x19,MIDI_LSB}},
				{name='Fader 6', label='C6', objectType='VFader', midi={0xB0,0x49,MIDI_LSB}},
				{name='Fader 7', label='C7', objectType='VFader', midi={0xB0,0x4A,MIDI_LSB}},
				{name='Fader 8', label='C8', objectType='VFader', midi={0xB0,0x46,MIDI_LSB}},

				{name='Knob 1', label='C10', objectType='Knob', midi={0xB0,0x16,MIDI_LSB}},
				{name='Knob 2', label='C11', objectType='Knob', midi={0xB0,0x17,MIDI_LSB}},
				{name='Knob 3', label='C12', objectType='Knob', midi={0xB0,0x3D,MIDI_LSB}},
				{name='Knob 4', label='C13', objectType='Knob', midi={0xB0,0x18,MIDI_LSB}},
				{name='Knob 5', label='C14', objectType='Knob', midi={0xB0,0x1A,MIDI_LSB}},
				{name='Knob 6', label='C15', objectType='Knob', midi={0xB0,0x1B,MIDI_LSB}},
				{name='Knob 7', label='C16', objectType='Knob', midi={0xB0,0x3E,MIDI_LSB}},
				{name='Knob 8', label='C17', objectType='Knob', midi={0xB0,0x5F,MIDI_LSB}},

				{name='Button 1', label='C18', objectType='Button', midiType='Single', midi={0xB0,0x50,MIDI_LSB}},
				{name='Button 2', label='C19', objectType='Button', midiType='Single', midi={0xB0,0x51,MIDI_LSB}},
				{name='Button 3', label='C20', objectType='Button', midiType='Single', midi={0xB0,0x52,MIDI_LSB}},
				{name='Button 4', label='C21', objectType='Button', midiType='Single', midi={0xB0,0x53,MIDI_LSB}},
				{name='Button 5', label='C22', objectType='Button', midiType='Single', midi={0xB0,0x54,MIDI_LSB}},
				{name='Button 6', label='C23', objectType='Button', midiType='Single', midi={0xB0,0x55,MIDI_LSB}},
				{name='Button 7', label='C24', objectType='Button', midiType='Single', midi={0xB0,0x56,MIDI_LSB}},
				{name='Button 8', label='C25', objectType='Button', midiType='Single', midi={0xB0,0x57,MIDI_LSB}},
				{name='Button 9', label='C26', objectType='Button', midiType='Single', midi={0xB0,0x58,MIDI_LSB}},			
				
				{name='LOOP', label='C27', objectType='Button', midiType='Momentary', midi={0xB0,0x71,MIDI_LSB}},
				{name='STOP', label='C28', objectType='Button', midiType='Momentary', midi={0xB0,0x74,MIDI_LSB}},
				{name='PLAY', label='C29', objectType='Button', midiType='Momentary', midi={0xB0,0x75,MIDI_LSB}},
				{name='RECORD', label='C30', objectType='Button', midiType='Momentary', midi={0xB0,0x76,MIDI_LSB}},
				
				{name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0x99,0x24,MIDI_LSB}},
				{name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0x99,0x26,MIDI_LSB}},
				{name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0x99,0x2A,MIDI_LSB}},
				{name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0x99,0x2E,MIDI_LSB}},
				{name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0x99,0x32,MIDI_LSB}},
				{name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0x99,0x2D,MIDI_LSB}},
				{name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0x99,0x33,MIDI_LSB}},
				{name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0x99,0x31,MIDI_LSB}},
			}
		}
end
