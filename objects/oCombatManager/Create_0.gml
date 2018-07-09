// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Combat Game Objects
gridObject				= instance_create_layer(0, 0, "ControllerLayer", oPuzzleBoard);
cameraControllerObject  = instance_create_layer(0, 0, "ControllerLayer", oCameraControllerCombat);
turnControllerObject	= instance_create_layer(0, 0, "ControllerLayer", oTurnControllerCombat);
combatMenu				= instance_create_layer(0, 0, "ControllerLayer", oCombatMenu);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Friendly Team
playerCombatZone					= instance_create_layer(32, ViewHeight() - 16, "GameLayer", oCombatZone);

combatPlayerObject1					= instance_create_layer(playerCombatZone.point1x, playerCombatZone.point1y, "GameLayer", oPlayerCombat);
combatPlayerObject1.startingX		= playerCombatZone.point1x;
combatPlayerObject1.startingY		= playerCombatZone.point1y;
combatPlayerObject1.depth			+= playerCombatZone.point1depth;
combatPlayerObject1.idleSprite		= sPlayerTemp_still;
combatPlayerObject1.hurtSprite		= sPlayerTemp_still;
combatPlayerObject1.attackSprite	= sPlayerTemp_still;
ds_list_add(turnControllerObject.friendlies, combatPlayerObject1);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Enemy Team
var nCreatures						= choose(1, 2, 3);
enemyCombatZone						= instance_create_layer(ViewWidth() - 32, ViewHeight() - 16, "GameLayer", oCombatZone);
if (nCreatures >= 1) {
	combatEnemyObject1				= instance_create_layer(enemyCombatZone.point1x, enemyCombatZone.point1y, "GameLayer", oEnemyCombat);	
	combatEnemyObject1.startingX	= enemyCombatZone.point1x;
	combatEnemyObject1.startingY	= enemyCombatZone.point1y;
	combatEnemyObject1.depth		+= enemyCombatZone.point1depth;
	combatEnemyObject1.idleSprite	= choose(sFireSkullBird_still, sWaterSnake_still, sWaterJellyfish_still, sWaterCrab_still, sCactusTortoise_still, sBranchFrog_still, sElectricSquid_still, sElectricWorm_still, sElectricCentipede_still);
	combatEnemyObject1.hurtSprite	= combatEnemyObject1.idleSprite;
	combatEnemyObject1.attackSprite	= combatEnemyObject1.idleSprite;
	ds_list_add(turnControllerObject.enemies, combatEnemyObject1);
}
if (nCreatures >= 2) {
	combatEnemyObject2				= instance_create_layer(enemyCombatZone.point2x, enemyCombatZone.point2y, "GameLayer", oEnemyCombat);	
	combatEnemyObject2.startingX	= enemyCombatZone.point2x;
	combatEnemyObject2.startingY	= enemyCombatZone.point2y;
	combatEnemyObject2.depth		+= enemyCombatZone.point2depth;
	combatEnemyObject2.idleSprite	= choose(sFireSkullBird_still, sWaterSnake_still, sWaterJellyfish_still, sWaterCrab_still, sCactusTortoise_still, sBranchFrog_still, sElectricSquid_still, sElectricWorm_still, sElectricCentipede_still);
	combatEnemyObject2.hurtSprite	= combatEnemyObject2.idleSprite;
	combatEnemyObject2.attackSprite	= combatEnemyObject2.idleSprite;
	ds_list_add(turnControllerObject.enemies, combatEnemyObject2);
}
if (nCreatures >= 3) {
	combatEnemyObject3				= instance_create_layer(enemyCombatZone.point3x, enemyCombatZone.point3y, "GameLayer", oEnemyCombat);	
	combatEnemyObject3.startingX	= enemyCombatZone.point3x;
	combatEnemyObject3.startingY	= enemyCombatZone.point3y;
	combatEnemyObject3.depth		+= enemyCombatZone.point3depth;
	combatEnemyObject3.idleSprite	= choose(sFireSkullBird_still, sWaterSnake_still, sWaterJellyfish_still, sWaterCrab_still, sCactusTortoise_still, sBranchFrog_still, sElectricSquid_still, sElectricWorm_still, sElectricCentipede_still);
	combatEnemyObject3.hurtSprite	= combatEnemyObject3.idleSprite;
	combatEnemyObject3.attackSprite	= combatEnemyObject3.idleSprite;
	ds_list_add(turnControllerObject.enemies, combatEnemyObject3);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
UpdateTeamOrder();
UpdateNextPlayerInLine();
UpdatePreviousPlayerInLine();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Spell Data
GlobalSpellData();