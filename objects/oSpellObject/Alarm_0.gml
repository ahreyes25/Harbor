/// @description Spell sound
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Basic spell only
if (global.spellData[sp, spellC.SpellName] == "Basic") {
	switch(oPuzzleBoard.basicSpellSound) {
		case 1: //fire
			audio_play_sound(soFireBurn, 0, 0);
			break;
		case 2: // water
			audio_play_sound(soWaterSplash, 0, 0);
			break;
		case 3: // leaf
			audio_play_sound(soLeafBury, 0, 0);
			break;
		case 4: // bolt
			audio_play_sound(soBoltStrike, 0, 0);
			break;
	}
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// all other spells
else {
	// Play Spell Sound
	var s = asset_get_index("so" + string(global.spellData[sp, spellC.SpellName]) + "Spell");
	audio_play_sound(s, 0, 0);
	// Stop charge sound
	audio_stop_sound(asset_get_index("so" + string(global.spellData[sp, spellC.SpellName]) + "Charge"));
}