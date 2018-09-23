// Character Variables
maxHealth		= noone;
currentHealth	= noone;

// Objects Belonging to Character
spellBook = noone;
inventory = noone;
skillTree = noone;

if (!instance_exists(spellBook) && spellBook != noone)
	instance_create_layer(0, 0, "ControllerLayer", spellBook);	
if (!instance_exists(inventory) && inventory != noone)
	instance_create_layer(0, 0, "ControllerLayer", inventory);	
if (!instance_exists(skillTree) && skillTree != noone)
	instance_create_layer(0, 0, "ControllerLayer", skillTree);	

// Other
state = noone;