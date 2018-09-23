// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// If board is not currently rotating
if (!instance_exists(oRotatingSurfaceManager) && !instance_exists(oRotatingBoard)) {
	// It is a friendly turn
	if (oCombatManager.turnControllerObject.currentTeamTurn = oCombatManager.turnControllerObject.friendlies) {
		if (oPuzzleBoard.inCombatMenu) {
			DrawCombatMenu();
		}
		if (attacking) {
			DrawSpellBook();
		}
	}
}