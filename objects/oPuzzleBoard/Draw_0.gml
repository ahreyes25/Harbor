if (!instance_exists(oRotatingSurfaceManager) && !instance_exists(oRotatingBoard)) {
	if (!inCombatMenu) {
		DrawBorder();
		DrawElements();
	
		if (oCombatManager.turnControllerObject.currentPlayerTurn.id.state == characterState.idle)
			DrawCursor();
	}
}