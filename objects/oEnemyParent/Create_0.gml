event_inherited();

// @Override

// Player variables
maxHealth		= 30;
currentHealth	= maxHealth;

// Objects Belonging to Player
spellBook = oSpellBookTest2;
inventory = object_get_parent(id).inventory;
skillTree = object_get_parent(id).skillTree;

if (!instance_exists(spellBook))
	instance_create_layer(0, 0, "ControllerLayer", spellBook);