switch(id.state) {
	#region // Apply Effect
	case characterState.applyEffect:
		image_speed  = 0.4;
		image_index  = id.image_index;
		sprite_index = idleSprite;
		image_xscale = facing;
		image_yscale = 1;
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	break;
	#endregion
	
	#region // Idle
	case characterState.idle:
		image_speed  = 0.4;
		image_index  = id.image_index;
		sprite_index = idleSprite;
		image_xscale = facing;
		image_yscale = 1;
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	break;
	#endregion
	
	#region // Charging Spell
	case characterState.chargingSpell:
		image_speed  = 0.4;
		image_index  = id.image_index;
		sprite_index = idleSprite;
		image_xscale = facing;
		image_yscale = 1;
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	break;
	#endregion
	
	#region // Hurt
	case characterState.hurt:
		image_speed	 = 0.7;
		image_index  = id.image_index;
		sprite_index = hurtSprite;
		image_xscale = facing;
		image_yscale = 1;
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	break;
	#endregion
	
	#region // Attacking
	case characterState.attacking:
		image_speed  = 0.0;
		image_index  = id.image_index;
		sprite_index = attackSprite;
		image_xscale = facing;
		image_yscale = 1;
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	break;
	#endregion
	
	#region // Using Item
	case characterState.usingItem:
		image_speed  = 0.4;
		image_index  = id.image_index;
		sprite_index = idleSprite;
		image_xscale = facing;
		image_yscale = 1;
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	break;
	#endregion
	
	#region // Waiting
	case characterState.waiting:
		image_speed  = 0.4;
		image_index  = id.image_index;
		sprite_index = idleSprite;
		image_xscale = facing;
		image_yscale = 1;
	
		// Draw attacking animation until spell object is gone
		if (instance_exists(oSpellObject) && oSpellObject.image_xscale == id.image_xscale && 
			oCombatManager.turnControllerObject.currentPlayerTurn == id) {
				image_speed  = 0.0;
				image_index  = id.image_index;
				sprite_index = attackSprite;
				image_xscale = facing;
				image_yscale = 1;
		}
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	break;
	#endregion
	
	#region // EndTurn
	case characterState.endTurn:
		image_speed  = 0.4;
		image_index  = id.image_index;
		sprite_index = idleSprite;
		image_xscale = facing;
		image_yscale = 1;
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	break;
	#endregion
}

draw_sprite_ext(sHeart, 0, startingX, combatZone.y + 4, 1, 1, 0, c_white, 1);
draw_text_transformed(startingX - 3, combatZone.y + 8, currentHealth, 0.3, 0.3, 0);