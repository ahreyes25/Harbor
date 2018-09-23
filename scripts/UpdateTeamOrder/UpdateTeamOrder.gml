// Update Team Order
if ((oCombatManager.turnControllerObject.currentTeamIndex + 1) < ds_list_size(oCombatManager.turnControllerObject.teams)) {
	oCombatManager.turnControllerObject.nextTeamTurn	= ds_list_find_value(oCombatManager.turnControllerObject.teams, oCombatManager.turnControllerObject.currentTeamIndex + 1);
	
	if (oCombatManager.turnControllerObject.currentTeamIndex == 0) {
		oCombatManager.turnControllerObject.previousTeamTurn = ds_list_find_value(oCombatManager.turnControllerObject.teams, ds_list_size(oCombatManager.turnControllerObject.teams) - 1);
	}
	else {
		oCombatManager.turnControllerObject.previousTeamTurn = ds_list_find_value(oCombatManager.turnControllerObject.teams, oCombatManager.turnControllerObject.currentTeamIndex - 1);	
	}
}
else {
	oCombatManager.turnControllerObject.nextTeamTurn		= ds_list_find_value(oCombatManager.turnControllerObject.teams, 0);
	oCombatManager.turnControllerObject.previousTeamTurn = ds_list_find_value(oCombatManager.turnControllerObject.teams, ds_list_size(oCombatManager.turnControllerObject.teams) - 2);
}