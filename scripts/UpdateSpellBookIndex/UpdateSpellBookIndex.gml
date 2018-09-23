// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Modify the current index of the current spell book
Input();
if (!oPuzzleBoard.inCombatMenu && oCombatManager.combatMenu.attacking && oCombatManager.combatMenu.inSpellBook) {
	if (rightPressed) {
		if (oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index < array_length_1d(oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data) - 1)
			oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index++;
		else
			oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index = 0;
	}
	if (leftPressed) {
		if (oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index > 0)
			oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index--;
		else
			oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index = array_length_1d(oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data) - 1;
	}
}