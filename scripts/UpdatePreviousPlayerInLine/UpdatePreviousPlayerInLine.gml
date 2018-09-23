
// Set Previous Player In Line
if ((oCombatManager.turnControllerObject.currentTeamPlayerIndex - 1) > 0) {
	oCombatManager.turnControllerObject.previousPlayerTurn = ds_list_find_value(oCombatManager.turnControllerObject.currentTeamTurn, oCombatManager.turnControllerObject.currentTeamPlayerIndex - 1);
}
else {
	oCombatManager.turnControllerObject.previousPlayerTurn = ds_list_find_value(oCombatManager.turnControllerObject.previousTeamTurn, ds_list_size(oCombatManager.turnControllerObject.currentTeamTurn) - 1);
}