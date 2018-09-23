/// @description Get the sound for the puzzle pieces when theyre selected

// Basic spell sound is calculated in CheckSpellForm script

var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

// If "piece to chain" == -1, get the sound for the piece that it is
if (global.spellData[sp, spellC.PieceToChain] == -1) {
	var p = ds_grid_get(global.grid, global.gridIndexX, global.gridIndexY) mod 10;
}
// If there is a chain piece, use that as the sound effect
else {
	// if piece to chain is same as spell type
	if (global.spellData[sp, spellC.PieceToChain] == global.spellData[sp, spellC.SpellType])
		var p = global.spellData[sp, spellC.PieceToChain];
	else
		var p = global.spellData[sp, spellC.SpellType];
}

switch(p) {
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
	case 5: // potion item
		audio_play_sound(soBoltStrike, 0, 0);
	break;
}