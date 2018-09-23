/// @description Moving to Spell
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Check if position is correct
if (global.gridIndexX != spellCursorX || global.gridIndexY != spellCursorY) {
	if (global.gridIndexX < spellCursorX)
		global.gridIndexX++;
	else if (global.gridIndexX > spellCursorX)
		global.gridIndexX--;
	else if (global.gridIndexY < spellCursorY)
		global.gridIndexY++
	else if (global.gridIndexY > spellCursorY)
		global.gridIndexY--;
	audio_play_sound(soCursorSlideFree, 0, 0);
	
	// Reset alarm and iterate again
	alarm[2] = irandom_range(2, 12);	
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// at spell location
else {
	// Cast Spell
	EnemyCastSpell(spellToCast, spellCursorX, spellCursorY);
	spellToCast		 = noone;
	spellCursorX	 = noone;
	spellCursorY	 = noone;
	searchedForSpell = false;
}