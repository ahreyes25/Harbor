/// @description Item On Board

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Potion
if (type == 5) {
	sprite_index = sPotionItem;
	image_index  = 5;
	image_speed  = 0;
	
	// Wait until done attack
	alarm[3] = 1;
	visible  = false;
	
	// hide behind wave
	if (instance_exists(oSpellObject))
		depth = oSpellObject.depth + 1;
	
	if (moveToPlayer) {	
		visible = true;
		// Trailing particles
		part_type_direction(p, point_direction(x, y, target.x, target.y), point_direction(x, y, target.x, target.y), 0, 10);
		part_particles_create(trail, x + random_range(-2, 2), y + random_range(-2, 2), p, 3);
	
		// Move to healing target
		if (!place_meeting(x, y, target)) {	
			x = SmoothStep(x, target.x, 0.9);
			y = SmoothStep(y, target.y, 0.9);
		
			if (!itemSound) {
				itemSound = true;
				audio_play_sound(soPotionSlide, 0, 0);
			}	
		}
		else {
			instance_destroy();
			alarm[2] = 15;
		}	
	}
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Shuffle
else if (type == 6) {
	sprite_index = sShuffleItem;
	image_index  = 0;
	image_speed  = 0;
	
	// Wait until done attacking
	alarm[1] = 1;
	visible  = false;
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Bottle
else if (type == 7) {
	sprite_index = sBottleItemSpin;
	image_speed  = 0.7;
	image_xscale = 0.8;
	image_yscale = 0.8;
	
	// hide behind wave
	if (instance_exists(oSpellObject))
		depth = oSpellObject.depth + 1;
	
	// hide behind chain sign
	if (instance_exists(oChainSign))
		depth = oChainSign.depth + 1;
	
	// how long the bottle spins for
	if (alarm[0] == -1)
		alarm[0] = 30;
		
	if(!itemSound) {
		itemSound = true;
		audio_sound_pitch(soBottleRocketClick, 2);
		audio_play_sound(soBottleRocketClick, 0, 1);
	}
}