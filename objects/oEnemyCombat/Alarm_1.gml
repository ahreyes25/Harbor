/// @description Rot, Flip, & Exit Spell Book
var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp	= oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

// Search through spell book data for matching spell
for (var i = 0; i < array_length_1d(spellBook.data); i++) {
	if (spellBook.data[i] == spellToCast) {
		spellBook.index = i;
	}
}

// Check if rotation is correct first
if (global.spellData[sp, spellC.Orientation] != spellRot) {
	// Rotate spell
	audio_play_sound(soRotateSpell, 0, 0);
	
	if (global.spellData[sp, spellC.Orientation] > spellRot)
		global.spellData[sp, spellC.Orientation] -= 90;
	else if (global.spellData[sp, spellC.Orientation] < spellRot)
		global.spellData[sp, spellC.Orientation] += 90;
	
	// Reset alarm and iterate again
	alarm[1] = irandom_range(8, 18);
}
else {
	// Check if flipping is correct then
	if (global.spellData[sp, spellC.FlipOrientation] != spellFlip) {
		
		// Flip spell
		global.spellData[sp, spellC.FlipOrientation] *= -1;
		audio_play_sound(soFlipSpell, 0, 0);
		
		// Reset alarm and iterate again
		alarm[1] = irandom_range(10, 20);
	}
	else {
		// Move out of spell book
		if (global.spellData[spellToCast, spellC.Orientation] == 0 || global.spellData[spellToCast, spellC.Orientation] == 180)
			var cursorHeight = global.spellData[spellToCast, spellC.CursorHeight];
		else
			var cursorHeight = global.spellData[spellToCast, spellC.CursorWidth];

		global.gridIndexX = floor(oPuzzleBoard.gridWidth / 2) - 1;
		global.gridIndexY = oPuzzleBoard.gridHeight - cursorHeight;

		// Exit spell book
		oCombatManager.combatMenu.inSpellBook = false;

		// Start moving to spell book
		if (alarm[2] == -1)
			alarm[2] = 10;
	}
}