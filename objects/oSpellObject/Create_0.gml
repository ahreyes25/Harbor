damageToDeal = 0;

ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Facing
if (oCombatManager.turnControllerObject.currentTeamTurn == oCombatManager.turnControllerObject.friendlies)
	image_xscale = 1;
else
	image_xscale = -1;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Sprite
if (global.spellData[sp, spellC.SpellID] == 0) {
	if (oPuzzleBoard.basicSpellSound == 1) { // basic fire
		sprite_index = sFireBasicAnimation;
	}
	else if (oPuzzleBoard.basicSpellSound == 2) { // basic water
		sprite_index = sWaterBasicAnimation;
	}
	else if (oPuzzleBoard.basicSpellSound == 3) { // basic leaf
		sprite_index = sLeafBasicAnimation;
	}
	else if (oPuzzleBoard.basicSpellSound == 4) { // basic bolt
		sprite_index = sBoltBasicAnimation;
	}
}
else 
	sprite_index = asset_get_index("s" + string(global.spellData[sp, spellC.SpellName]) + "Animation");
image_index = 0;
image_speed = 1.0;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Spell Sound
// Check for chargesound
if (global.spellData[sp, spellC.HasChargeSound]) {
	var s = asset_get_index("so" + string(global.spellData[sp, spellC.SpellName]) + "Charge");
	audio_play_sound(s, 0, 0);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Sound Delay to sync spell sound with animation
alarm[0] = global.spellData[sp, spellC.SoundDelay];

owner	 = noone;