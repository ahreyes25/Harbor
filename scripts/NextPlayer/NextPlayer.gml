// Check to see if everyone has attacked
var hasAttacked = 0;
var teamSize = ds_list_size(oCombatManager.turnControllerObject.currentTeamTurn);
for (var i = 0; i < teamSize; i++) {
	var t = ds_list_find_value(oCombatManager.turnControllerObject.currentTeamTurn, i);
	
	if(t.attackedThisTurn)
		hasAttacked++;
}

// If everyone has attacked, move onto the next team
if (hasAttacked == teamSize) {
	NextTeam();	
}
// If not everyone has attacked, allow current player to attack
else {
	UpdateTeamOrder();
	UpdateNextPlayerInLine();
	UpdatePreviousPlayerInLine();
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Set Player States
	oCombatManager.turnControllerObject.currentPlayerTurn.id.state  = "waiting";
	oCombatManager.turnControllerObject.nextPlayerTurn.id.state = "idle";

	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Next Player
	if (oCombatManager.turnControllerObject.currentTeamPlayerIndex < ds_list_size(oCombatManager.turnControllerObject.currentTeamTurn) - 1) {
		oCombatManager.turnControllerObject.currentTeamPlayerIndex++;
	}
	else {
		oCombatManager.turnControllerObject.currentTeamPlayerIndex	= 0;
	}

	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Set Current Player, we need to update who the current player is
	oCombatManager.turnControllerObject.currentPlayerTurn = ds_list_find_value(oCombatManager.turnControllerObject.currentTeamTurn, oCombatManager.turnControllerObject.currentTeamPlayerIndex);

	if (!oCombatManager.turnControllerObject.currentPlayerTurn.attackedThisTurn) {
		if (!oPuzzleBoard.inCombatMenu) {
			oCombatManager.combatMenu.inSpellBook = true;	
		}
	}
	else {
		oPuzzleBoard.inCombatMenu = true;
		oCombatManager.combatMenu.inSpellBook = false;
		oCombatManager.combatMenu.attacking = false;
	}

	UpdateTeamOrder();
	UpdateNextPlayerInLine();
	UpdatePreviousPlayerInLine();
}