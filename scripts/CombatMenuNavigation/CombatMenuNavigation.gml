// Basic Combat Menu Navigation From Option to Option and Cycling 
// Between Characters In the Combat Menu

// Currently in Menu
if (oPuzzleBoard.inCombatMenu && !oCombatManager.combatMenu.attacking && !oCombatManager.combatMenu.inSpellBook) { // && !inActionMenu && !inSpellMenu && !inItemMenu) {
	Input();
	combatMenuArray[combatMenuIndex] = true;
		
	// Move Down Menu
	if (downPressed) {
		audio_play_sound(soMenuMove, 0, 0);
		if (combatMenuIndex < array_length_1d(oCombatMenu.combatMenuArray) - 1) {
			combatMenuArray[combatMenuIndex] = false;
			combatMenuIndex++;
			combatMenuArray[combatMenuIndex] = true;
		}
		else {
			combatMenuArray[combatMenuIndex] = false;
			combatMenuIndex = 0;
			combatMenuArray[combatMenuIndex] = true;
		}
	}
	
	// Move Up Menu
	if (upPressed) {
		audio_play_sound(soMenuMove, 0, 0);
		if (combatMenuIndex > 0) {
			combatMenuArray[combatMenuIndex] = false;
			combatMenuIndex--;	
			combatMenuArray[combatMenuIndex] = true;
		}
		else {
			combatMenuArray[combatMenuIndex] = false;
			combatMenuIndex = array_length_1d(oCombatMenu.combatMenuArray) - 1;
			combatMenuArray[combatMenuIndex] = true;
		}
	}
	
	// Cycle To The Next Player
	if (rightPressed) {
		NextPlayer();	
	}
	
	// Cycle To The Previous Player
	if (leftPressed) {
		PreviousPlayer();	
	}
	
	// Enter into attack menu
	if (action1Pressed) {
		if (combatMenuIndex == 0) {
			// If Character Hasnt Attacked This Turn
			if (!oCombatManager.turnControllerObject.currentPlayerTurn.attackedThisTurn) {
				audio_play_sound(soCombatMenuSelect, 0, 0);
				attacking	 = true;
				inSpellBook	 = true;
				combatMenuArray[combatMenuIndex] = true;
				RotateBoard();
			}
			else {
				audio_play_sound(soCombatMenuReject, 0, 0);
			}
		}
	}
}