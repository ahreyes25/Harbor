enum characterState {
	idle, applyEffect, chargingSpell, hurt, waiting,
	endTurn, attacking, usingItem, 
}

maxHealth		= noone;
currentHealth	= noone;
spellBook		= noone;
inventory		= noone;
skillTree		= noone;
state			= noone;

if (!instance_exists(spellBook) && spellBook != noone) instance_create_layer(0, 0, "ControllerLayer", spellBook);	
if (!instance_exists(inventory) && inventory != noone) instance_create_layer(0, 0, "ControllerLayer", inventory);	
if (!instance_exists(skillTree) && skillTree != noone) instance_create_layer(0, 0, "ControllerLayer", skillTree);	