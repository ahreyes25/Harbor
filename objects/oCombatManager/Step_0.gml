// If player turn, player must be in idle state
if (turnControllerObject.currentPlayerTurn.id.state == "idle") {
	UpdateDataReference();
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Friendly turn
	if (turnControllerObject.currentTeamTurn == turnControllerObject.friendlies) {
		// Check for matching spell configurations
		UpdateSpellBookIndex();
		CheckSpellForms(); // check spell forms needs to come before update cursor position
		UpdateCursorPosition();
		RotateSpell();
		FlipSpell();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Enemy turn
	else if (turnControllerObject.currentTeamTurn == turnControllerObject.enemies) {		
		// Decide which AI script to use
		if (!turnControllerObject.currentPlayerTurn.searchedForSpell) {
			GreedyEnemyAI();
		}
	}
}