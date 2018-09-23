friendlies	= ds_list_create();
enemies		= ds_list_create();
teams		= ds_list_create();

ds_list_add(teams, friendlies);
ds_list_add(teams, enemies);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Tracking Turns
currentTeamPlayerIndex	= 0;
currentTeamIndex		= 0;

currentTeamTurn		= friendlies;
nextTeamTurn		= noone;
previousTeamTurn	= noone;

currentPlayerTurn	= ds_list_find_value(currentTeamTurn, currentTeamPlayerIndex);
nextPlayerTurn		= noone;
previousPlayerTurn	= noone;