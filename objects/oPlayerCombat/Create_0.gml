event_inherited();
// @Override
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Player variables
maxHealth			= object_get_parent(id).maxHealth;
currentHealth		= object_get_parent(id).currentHealth;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Game Objects belonging to player
spellBook		= object_get_parent(id).spellBook;
inventory		= object_get_parent(id).inventory;
skillTree		= object_get_parent(id).skillTree;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Sprites
idleSprite		= noone;
hurtSprite		= noone;
attackSprite	= noone;

if (x > room_width / 2)
	facing = -1;
else
	facing = 1;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Other
if (oCombatManager.turnControllerObject.currentPlayerTurn.id == id)
	state	= "idle";
else
	state	= "waiting";
	
combatZone			= oCombatManager.playerCombatZone;
playedHurtSound		= false;
effectApplied		= false;
chainCount			= 0;
attackTarget		= oEnemyCombat;
startingX			= noone;
startingY			= noone; 
attackedThisTurn	= false;