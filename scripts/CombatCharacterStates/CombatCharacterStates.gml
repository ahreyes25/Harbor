// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Character Combat states
// Idle
if (state == "idle") {
	// Reset knockback
	x = startingX;
	playedHurtSound = false;
}

// Charging Spell
if (state == "chargingSpell") {
	// Move into attacking state
	if (instance_exists(oSpellObject))
		state = "attacking";
}

// Hurt
if (state == "hurt") {
	if (alarm[0] == -1) {
		// Set cooldown reset timer
		alarm[0] = 20;
	
		// Asthetic
		if (!playedHurtSound) {
			audio_play_sound(soHurt, 0, 0);
			ShakeScreen(oPuzzleBoard.defaultScreenShake, oPuzzleBoard.defaultScreenShake);
			ScreenFlash(oPuzzleBoard.defaultScreenFlash);
			playedHurtSound = true;
		}
		
		// Character knockback
		x += (4 * -image_xscale);
	}
}

// Attacking
if (state == "attacking") {
	// Transition out of attacking into using item
	if (alarm[0] == -1)
		alarm[0] = 30;
}

// Using Item
if (state == "usingItem") {
	// Automatically transition to next player
	NextPlayer();
}

// Waiting
if (state == "waiting") {
	// Set getting hurt
	if (instance_exists(oSpellObject) && place_meeting(id.x, id.y, oSpellObject) && oSpellObject.image_xscale != id.image_xscale)
		state = "hurt";
		
	// Reset knockback
	x = startingX;
	
	// Reset hurt sound
	if (!instance_exists(oSpellObject))
		playedHurtSound = false;
}

// End Turn
if (state == "endTurn") {
	playedHurtSound = false;
	state = "waiting";
}