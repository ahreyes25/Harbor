// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Player Alarm[0]
// Hurt
if (state == "hurt") {
	state = "waiting";
	//playedHurtSound = false;
}

// Attacking
if (state == "attacking") {
	if (instance_exists(oSpellObject))
		alarm[0] = 1;
	else
		state = "usingItem";
}
