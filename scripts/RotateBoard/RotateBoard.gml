// Rotate the board into and out of the combat menu

if (!instance_exists(oRotatingSurfaceManager) && !instance_exists(oRotatingBoard)) {
	var i = instance_create_layer(oPuzzleBoard.gridXOffset, oPuzzleBoard.gridYOffset, "ControllerLayer", oRotatingSurfaceManager);
	if (!oPuzzleBoard.inCombatMenu) {
		i.first = "board";
		oPuzzleBoard.inCombatMenu = true;
	}
	else {
		i.first = "combatMenu";
		oPuzzleBoard.inCombatMenu = false;
	}
}