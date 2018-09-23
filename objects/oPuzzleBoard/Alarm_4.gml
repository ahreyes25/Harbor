/// @description Chain Delete

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Delete main body pieces
for (var i = 0; i < oPuzzleBoard.gridWidth; i++) {
	for (var j = 0; j < oPuzzleBoard.gridHeight; j++) {
		if (ds_grid_get(global.grid, i, j) >= 10)
			ds_grid_set(global.grid, i, j, 0);
	}
}

postChainCount = CountPiece(global.spellData[sp, spellC.PieceToChain]);
damageToDeal  += CalculateSpellDamage();
damageToDeal  += (preChainCount - postChainCount);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Trigger the next event in the chain
alarm[5] = emptyPieceLength;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Spawn Spell if accuracy lands
if (Chance(global.spellData[sp, spellC.Accuracy]))
	CreateSpellObject(damageToDeal);
	
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Spell missed!
else {
	var t = instance_create_layer(oCombatManager.turnControllerObject.nextPlayerTurn.x - 5,
								  oCombatManager.turnControllerObject.nextPlayerTurn.y - 10,
								  "PointsLayer", oText);
	t.text = "Missed!";
	oCombatManager.turnControllerObject.currentPlayerTurn.id.state = characterState.usingItem;
}