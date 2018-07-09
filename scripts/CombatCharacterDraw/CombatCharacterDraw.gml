// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Draw player sprites
// Apply Effect
if (id.state == "applyEffect") {
	image_speed  = 0.4;
	image_index  = id.image_index;
	sprite_index = idleSprite;
	image_xscale = facing;
	image_yscale = yscale;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

// Idle
if (id.state == "idle") {
	image_speed  = 0.4;
	image_index  = id.image_index;
	sprite_index = idleSprite;
	image_xscale = facing;
	image_yscale = yscale;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

// Charging Spell
if (id.state == "chargingSpell") {
	// Change to charging animation!!!!
	image_speed  = 0.4;
	image_index  = id.image_index;
	sprite_index = idleSprite;
	image_xscale = facing;
	image_yscale = yscale;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

// Hurt
if (id.state == "hurt") {
	image_speed	 = 0.7;
	image_index  = id.image_index;
	sprite_index = hurtSprite;
	image_xscale = facing;
	image_yscale = yscale;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

// Attacking
if (id.state == "attacking") {
	image_speed  = 0.0;
	image_index  = id.image_index;
	sprite_index = attackSprite;
	image_xscale = facing;
	image_yscale = yscale;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
 
// Using Item
if (id.state == "usingItem") {
	image_speed  = 0.4;
	image_index  = id.image_index;
	sprite_index = idleSprite;
	image_xscale = facing;
	image_yscale = yscale;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

// Waiting
if (id.state == "waiting") {
	image_speed  = 0.4;
	image_index  = id.image_index;
	sprite_index = idleSprite;
	image_xscale = facing;
	image_yscale = yscale;
	
	// Draw attacking animation until spell object is gone
	if (instance_exists(oSpellObject) && oSpellObject.image_xscale == id.image_xscale && 
		oCombatManager.turnControllerObject.currentPlayerTurn == id) {
			image_speed  = 0.0;
			image_index  = id.image_index;
			sprite_index = attackSprite;
			image_xscale = facing;
			image_yscale = yscale;
	}
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

// End Turn
if (id.state == "endTurn") {
	image_speed  = 0.4;
	image_index  = id.image_index;
	sprite_index = idleSprite;
	image_xscale = facing;
	image_yscale = yscale;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

//draw_sprite_ext(sHeart, 0, startingX, combatZone.y + 4, xscale, yscale, 0, c_white, 1);
//draw_text_transformed(startingX - 3, combatZone.y + 8, currentHealth, 0.3, 0.3, 0);