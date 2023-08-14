-- Return the list of valid controllers
function controller_names(channel)
	if channel == 0 then
		return {
				[0x00] = 'Fader 1', 
				[0x01] = 'Fader 2', 
				[0x02] = 'Fader 3', 
				[0x03] = 'Fader 4', 
				[0x04] = 'Fader 5', 
				[0x05] = 'Fader 6', 
				[0x06] = 'Fader 7', 
				[0x07] = 'Fader 8', 
				[0x10] = 'Knob 1', 
				[0x11] = 'Knob 2', 
				[0x12] = 'Knob 3', 
				[0x13] = 'Knob 4', 
				[0x14] = 'Knob 5', 
				[0x15] = 'Knob 6', 
				[0x16] = 'Knob 7', 
				[0x17] = 'Knob 8', 
				[0x20] = 'Solo 1', 
				[0x21] = 'Solo 2', 
				[0x22] = 'Solo 3', 
				[0x23] = 'Solo 4', 
				[0x24] = 'Solo 5', 
				[0x25] = 'Solo 6', 
				[0x26] = 'Solo 7', 
				[0x27] = 'Solo 8', 
				[0x29] = 'Play', 
				[0x2A] = 'Stop', 
				[0x2B] = 'Rewind', 
				[0x2C] = 'Forward', 
				[0x2D] = 'Record', 
				[0x2E] = 'Cycle', 
				[0x30] = 'Mute 1', 
				[0x31] = 'Mute 2', 
				[0x32] = 'Mute 3', 
				[0x33] = 'Mute 4', 
				[0x34] = 'Mute 5', 
				[0x35] = 'Mute 6', 
				[0x36] = 'Mute 7', 
				[0x37] = 'Mute 8', 
				[0x3A] = 'Track ◀', 
				[0x3B] = 'Track ▶', 
				[0x3C] = 'Marker Set', 
				[0x3D] = 'Marker ◀', 
				[0x3E] = 'Marker ▶', 
				[0x40] = 'Record 1', 
				[0x41] = 'Record 2', 
				[0x42] = 'Record 3', 
				[0x43] = 'Record 4', 
				[0x44] = 'Record 5', 
				[0x45] = 'Record 6', 
				[0x46] = 'Record 7', 
				[0x47] = 'Record 8', 
				}
	else
		return nil
	end
end
-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'nanoKONTROL2',
		-- manufacturer name for this device
		manufacturer = 'Korg',

		-- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Track ◀', label='Track ◀', objectType='Button', midiType='Momentary', midi={0xB0,0x3A,MIDI_LSB}},
				{name='Track ▶', label='Track ▶', objectType='Button', midiType='Momentary', midi={0xB0,0x3B,MIDI_LSB}},

				{name='Cycle', label='Cycle', objectType='Button', midiType='Momentary', midi={0xB0,0x2E,MIDI_LSB}},

				{name='Marker Set', label='Set', objectType='Button', midiType='Momentary', midi={0xB0,0x3C,MIDI_LSB}},
				{name='Marker ◀', label='◀', objectType='Button', midiType='Momentary', midi={0xB0,0x3D,MIDI_LSB}},
				{name='Marker ▶', label='▶', objectType='Button', midiType='Momentary', midi={0xB0,0x3E,MIDI_LSB}},

				{name='Rewind', label='Rewind', objectType='Button', midiType='Momentary', midi={0xB0,0x2B,MIDI_LSB}},
				{name='Forward', label='Forward', objectType='Button', midiType='Momentary', midi={0xB0,0x2C,MIDI_LSB}},
				{name='Stop', label='Stop', objectType='Button', midiType='Momentary', midi={0xB0,0x2A,MIDI_LSB}},
				{name='Play', label='Play', objectType='Button', midiType='Momentary', midi={0xB0,0x29,MIDI_LSB}},
				{name='Record', label='Record', objectType='Button', midiType='Momentary', midi={0xB0,0x2D,MIDI_LSB}},

				{name='Fader 8', label='Volume', objectType='VFader',midi={0xB0,0x07,MIDI_LSB}},

				{name='Knob 1', label='Knob 1', objectType='Knob',midi={0xB0,0x10,MIDI_LSB}},
				{name='Knob 2', label='Knob 2', objectType='Knob',midi={0xB0,0x11,MIDI_LSB}},
				{name='Knob 3', label='Knob 3', objectType='Knob',midi={0xB0,0x12,MIDI_LSB}},
				{name='Knob 4', label='Knob 4', objectType='Knob',midi={0xB0,0x13,MIDI_LSB}},
				{name='Knob 5', label='Knob 5', objectType='Knob',midi={0xB0,0x14,MIDI_LSB}},
				{name='Knob 6', label='Knob 6', objectType='Knob',midi={0xB0,0x15,MIDI_LSB}},
				{name='Knob 7', label='Knob 7', objectType='Knob',midi={0xB0,0x16,MIDI_LSB}},
				{name='Knob 8', label='Knob 8', objectType='Knob',midi={0xB0,0x17,MIDI_LSB}},

				{name='Fader 1', label='Fader 1', objectType='VFader',midi={0xB0,0x00,MIDI_LSB}},
				{name='Fader 2', label='Fader 2', objectType='VFader',midi={0xB0,0x01,MIDI_LSB}},
				{name='Fader 3', label='Fader 3', objectType='VFader',midi={0xB0,0x02,MIDI_LSB}},
				{name='Fader 4', label='Fader 4', objectType='VFader',midi={0xB0,0x03,MIDI_LSB}},
				{name='Fader 5', label='Fader 5', objectType='VFader',midi={0xB0,0x04,MIDI_LSB}},
				{name='Fader 6', label='Fader 6', objectType='VFader',midi={0xB0,0x05,MIDI_LSB}},
				{name='Fader 7', label='Fader 7', objectType='VFader',midi={0xB0,0x06,MIDI_LSB}},

				{name='Solo 1', label='Solo 1', objectType='Button', midiType='Momentary', midi={0xB0,0x20,MIDI_LSB}},
				{name='Solo 2', label='Solo 2', objectType='Button', midiType='Momentary', midi={0xB0,0x21,MIDI_LSB}},
				{name='Solo 3', label='Solo 3', objectType='Button', midiType='Momentary', midi={0xB0,0x22,MIDI_LSB}},
				{name='Solo 4', label='Solo 4', objectType='Button', midiType='Momentary', midi={0xB0,0x23,MIDI_LSB}},
				{name='Solo 5', label='Solo 5', objectType='Button', midiType='Momentary', midi={0xB0,0x24,MIDI_LSB}},
				{name='Solo 6', label='Solo 6', objectType='Button', midiType='Momentary', midi={0xB0,0x25,MIDI_LSB}},
				{name='Solo 7', label='Solo 7', objectType='Button', midiType='Momentary', midi={0xB0,0x26,MIDI_LSB}},
				{name='Solo 8', label='Solo 8', objectType='Button', midiType='Momentary', midi={0xB0,0x27,MIDI_LSB}},

				{name='Mute 1', label='Mute 1', objectType='Button', midiType='Momentary', midi={0xB0,0x30,MIDI_LSB}},
				{name='Mute 2', label='Mute 2', objectType='Button', midiType='Momentary', midi={0xB0,0x31,MIDI_LSB}},
				{name='Mute 3', label='Mute 3', objectType='Button', midiType='Momentary', midi={0xB0,0x32,MIDI_LSB}},
				{name='Mute 4', label='Mute 4', objectType='Button', midiType='Momentary', midi={0xB0,0x33,MIDI_LSB}},
				{name='Mute 5', label='Mute 5', objectType='Button', midiType='Momentary', midi={0xB0,0x34,MIDI_LSB}},
				{name='Mute 6', label='Mute 6', objectType='Button', midiType='Momentary', midi={0xB0,0x35,MIDI_LSB}},
				{name='Mute 7', label='Mute 7', objectType='Button', midiType='Momentary', midi={0xB0,0x36,MIDI_LSB}},
				{name='Mute 8', label='Mute 8', objectType='Button', midiType='Momentary', midi={0xB0,0x37,MIDI_LSB}},

				{name='Record 1', label='Record 1', objectType='Button', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},
				{name='Record 2', label='Record 2', objectType='Button', midiType='Momentary', midi={0xB0,0x41,MIDI_LSB}},
				{name='Record 3', label='Record 3', objectType='Button', midiType='Momentary', midi={0xB0,0x42,MIDI_LSB}},
				{name='Record 4', label='Record 4', objectType='Button', midiType='Momentary', midi={0xB0,0x43,MIDI_LSB}},
				{name='Record 5', label='Record 5', objectType='Button', midiType='Momentary', midi={0xB0,0x44,MIDI_LSB}},
				{name='Record 6', label='Record 6', objectType='Button', midiType='Momentary', midi={0xB0,0x45,MIDI_LSB}},
				{name='Record 7', label='Record 7', objectType='Button', midiType='Momentary', midi={0xB0,0x46,MIDI_LSB}},
				{name='Record 8', label='Record 8', objectType='Button', midiType='Momentary', midi={0xB0,0x47,MIDI_LSB}},
			}
		}
end
