event_inherited();

maxHealth		= 30;
currentHealth	= maxHealth;
spellBook		= oSpellBookMaster;
inventory		= object_get_parent(id).inventory;
skillTree		= object_get_parent(id).skillTree;

if (!instance_exists(spellBook)) instance_create_layer(0, 0, "ControllerLayer", spellBook);

idleSprite		= noone;
hurtSprite		= noone;
attackSprite	= noone;

if (x > room_width / 2) facing = -1;
else facing = 1;

if (oCombatManager.turnControllerObject.currentPlayerTurn.id == id)
	state = characterState.idle;
else
	state = characterState.waiting;

searchedForSpell	= false;
spellToCast			= noone;
spellCursorX		= noone;
spellCursorY		= noone;
spellRot			= 0;
spellFlip			= 1;
chainCount			= 0;

combatZone			= oCombatManager.enemyCombatZone;
playedHurtSound		= false;
attackTarget		= oPlayerCombat;
startingX			= noone;
startingY			= noone; 
attackedThisTurn	= false;