/// @description Shuffle Item
if (oCombatManager.turnControllerObject.currentPlayerTurn.id.state != "usingItem") {
	alarm[1] = 1;
}
else {
	instance_destroy();
}