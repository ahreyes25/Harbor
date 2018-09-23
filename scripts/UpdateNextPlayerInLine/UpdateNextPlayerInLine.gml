// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Next Player In Line
if ((oCombatManager.turnControllerObject.currentTeamPlayerIndex + 1) < ds_list_size(oCombatManager.turnControllerObject.currentTeamTurn)) {
	oCombatManager.turnControllerObject.nextPlayerTurn = ds_list_find_value(oCombatManager.turnControllerObject.currentTeamTurn, oCombatManager.turnControllerObject.currentTeamPlayerIndex + 1);
}
else {
	oCombatManager.turnControllerObject.nextPlayerTurn = ds_list_find_value(oCombatManager.turnControllerObject.currentTeamTurn, 0);
}