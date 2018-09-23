/// @description Draw all the elements that make up the spell book that are dynamic and changing
Input();		
		
var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

// Get rotation
if (global.spellData[sp, spellC.CanRotate])
	var rot	= global.spellData[sp, spellC.Orientation];
else 
	var rot = 0;
	
// Get flip orientation
if (global.spellData[sp, spellC.CanFlip])
	var flp = global.spellData[sp, spellC.FlipOrientation];
else
	var flp = 1;
	
var spr = asset_get_index("s" + string(global.spellData[sp, spellC.SpellName]) + "Spell");
image_speed = 0.05;
draw_sprite_ext(spr, -1, room_width / 2 - 21, 63, flp, 1, rot, c_white, 1);

// Draw White Outline for Spell
var sprStill = asset_get_index("s" + string(global.spellData[sp, spellC.SpellName]) + "SpellFrame");
if (oCombatManager.combatMenu.inSpellBook)
	draw_sprite_ext(sprStill, 0, room_width / 2 - 21, 63, flp, 1, rot, c_white, 1);

// Update color if player is in spellBook
if (oCombatManager.combatMenu.inSpellBook)
	var c = c_white;
else
	var c = make_color_rgb(29, 43, 83);

// Draw Spell title
var title = global.spellData[sp, spellC.SpellName];
draw_text_transformed_color(room_width / 2 - 3, 57, title, 0.30, 0.30, 0, c, c, c, c, 1.0);	
	
// Draw spell info 
var desc = global.spellData[sp, spellC.SpellInfo];
draw_text_transformed_color(room_width / 2 - 3, 62, desc,  0.30, 0.30, 0, c, c, c, c, 1.0);	

// Draw rotate button
if (oCombatManager.turnControllerObject.currentTeamTurn == oCombatManager.turnControllerObject.friendlies) {
	if (global.spellData[sp, spellC.CanRotate]) {
		var framex = room_width / 2 - 20;
		var framey = 63;
		if (oCombatManager.combatMenu.inSpellBook) {
			if (rotateLeftHold || rotateRightHold) {
				draw_sprite_ext(sRotate, 7, framex - 11, framey - 6, .5, .5, 0, c_white, 1);	
			}
			else {	
				image_speed = 0.2;
				draw_sprite_ext(sRotate, image_index, framex - 11, framey - 6, .5, .5, 0, c_white, 1);
			}
		}
		else {
			image_speed = 0;
			draw_sprite_ext(sRotate, 7, framex - 11, framey - 6, .5, .5, 0, make_color_rgb(29, 43, 83), 1);
		}
	}

	// Draw flip button
	if (global.spellData[sp, spellC.CanFlip]) {
		var framex = room_width / 2 - 20;
		var framey = 63;
		if (oCombatManager.combatMenu.inSpellBook) {
			if (flipHold) {
				draw_sprite_ext(sFlip, 7, framex - 14, framey, .5, .5, 0, c_white, 1);	
			}
			else {	
				image_speed = 0.2;
				draw_sprite_ext(sFlip, image_index, framex - 14, framey, .5, .5, 0, c_white, 1);
			}
		}
		else {
			image_speed = 0;
			draw_sprite_ext(sFlip, 7, framex - 14, framey, .5, .5, 0, make_color_rgb(29, 43, 83), 1);
		}
	}
}

// Draw Spell Book Arrows
if(oCombatManager.combatMenu.inSpellBook) {
	// Press Right
	if (right && oCombatManager.turnControllerObject.currentTeamTurn == oCombatManager.turnControllerObject.friendlies) {
		if (rightPressed)
			audio_play_sound(soSpellBookTurn, 0, 0);
		draw_sprite_ext(sLeftArrow,  0, room_width / 2 - 41, 64, 1, 1, 0, c_white, 1);
		draw_sprite_ext(sRightArrow, 0, room_width / 2 + 39, 64, 1, 1, 0, make_color_rgb(29, 43, 83), 1);
	}
	// Press Left
	else if (left && oCombatManager.turnControllerObject.currentTeamTurn == oCombatManager.turnControllerObject.friendlies) {
		if (leftPressed)
			audio_play_sound(soSpellBookTurn, 0, 0);
		draw_sprite_ext(sLeftArrow,  0, room_width / 2 - 41, 64, 1, 1, 0, make_color_rgb(29, 43, 83), 1);
		draw_sprite_ext(sRightArrow, 0, room_width / 2 + 39, 64, 1, 1, 0, c_white, 1);
	}
	// No Key Press
	else {
		draw_sprite_ext(sLeftArrow,  0, room_width / 2 - 41, 64, 1, 1, 0, c_white, 1);
		draw_sprite_ext(sRightArrow, 0, room_width / 2 + 39, 64, 1, 1, 0, c_white, 1);	
	}
}
else if (!oCombatManager.combatMenu.inSpellBook) {
	draw_sprite_ext(sLeftArrow,  0, room_width / 2 - 41, 64, 1, 1, 0, make_color_rgb(29, 43, 83), 1);
	draw_sprite_ext(sRightArrow, 0, room_width / 2 + 39, 64, 1, 1, 0, make_color_rgb(29, 43, 83), 1);	
}	