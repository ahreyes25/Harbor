// Check For Death Conditions
if (currentHealth <= 0)
	instance_destroy();

switch(state) {
	#region // Idle
	case characterState.idle:
		x = startingX; // Reset Knockback
		playedHurtSound = false;
	break;
	#endregion
	
	#region // Charging Spell
	case characterState.chargingSpell:
		if (instance_exists(oSpellObject))
			state = characterState.attacking;
	break;
	#endregion
	
	#region // Hurt
	case characterState.hurt: 
		if (alarm[0] == -1) {
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
	break;
	#endregion
	
	#region // Attacking
	case characterState.attacking:
		// Transition out of attacking into using item
		if (alarm[0] == -1)
			alarm[0] = 30;
	break;
	#endregion
	
	#region // Using Item
	case characterState.usingItem:
		NextPlayer();
	break;
	#endregion
	
	#region // Waiting
	case characterState.waiting:
		// Set getting hurt
		if (instance_exists(oSpellObject) && place_meeting(id.x, id.y, oSpellObject) && oSpellObject.image_xscale != id.image_xscale)
			state = characterState.hurt;
		
		// Reset knockback
		x = startingX;
	
		// Reset hurt sound
		if (!instance_exists(oSpellObject))
			playedHurtSound = false;
	break;
	#endregion
	
	#region // End Turn
	case characterState.endTurn:
		playedHurtSound = false;
		state = characterState.waiting;
	break;
	#endregion
}