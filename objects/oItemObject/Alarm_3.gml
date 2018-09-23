/// @description Potion Item
if (oCombatManager.turnControllerObject.currentPlayerTurn.id.state != characterState.usingItem) {
	alarm[3] = 1;
}
else {
	moveToPlayer = true;
}