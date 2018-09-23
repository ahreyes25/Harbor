/// @description	This script immediately skips to the next team, skipping past all of the other
//					players in line. It skips to the next team, and sets the current player to the 
//					first player in that list.

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Next Team
UpdateTeamOrder();
UpdateNextPlayerInLine();
UpdatePreviousPlayerInLine();

// Set Old Team States
for (var i = 0; i < ds_list_size(oCombatManager.turnControllerObject.currentTeamTurn); i++) {
	var t = ds_list_find_value(oCombatManager.turnControllerObject.currentTeamTurn, i);
	t.state = "waiting";
}

// If the current team is not the last team in the team manager list, then move onto the next team
if (oCombatManager.turnControllerObject.currentTeamIndex < ds_list_size(oCombatManager.turnControllerObject.teams) - 1) {
	oCombatManager.turnControllerObject.currentTeamIndex++;
}
// If the current team is the last team in the team manager list, then move onto the first team 
else {
	oCombatManager.turnControllerObject.currentTeamIndex = 0;
}
// Set the current player to be the first player in that list
oCombatManager.turnControllerObject.currentTeamPlayerIndex = 0;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Update current team and current player
oCombatManager.turnControllerObject.currentTeamTurn		= ds_list_find_value(oCombatManager.turnControllerObject.teams, oCombatManager.turnControllerObject.currentTeamIndex);
oCombatManager.turnControllerObject.currentPlayerTurn	= ds_list_find_value(oCombatManager.turnControllerObject.currentTeamTurn, oCombatManager.turnControllerObject.currentTeamPlayerIndex);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Player States
oCombatManager.turnControllerObject.currentPlayerTurn.id.state  = "idle";

// Whipe out all of whos attacked so far
for (var i = 0; i < ds_list_size(oCombatManager.turnControllerObject.friendlies); i++) {
	var t = ds_list_find_value(oCombatManager.turnControllerObject.friendlies, i);
	t.attackedThisTurn = false;	
}
for (var i = 0; i < ds_list_size(oCombatManager.turnControllerObject.enemies); i++) {
	var t = ds_list_find_value(oCombatManager.turnControllerObject.enemies, i);
	t.attackedThisTurn = false;	
}

// Update all of our other variables before moving on...
UpdateTeamOrder();
UpdateNextPlayerInLine();
UpdatePreviousPlayerInLine();