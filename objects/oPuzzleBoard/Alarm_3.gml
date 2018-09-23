/// @description Chain

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Element animation image_index start at 0
image_index = 0;

if (waveCounter > 0) {
	for (var i = 0; i < oPuzzleBoard.gridWidth; i++) {
		for (var j = 0; j < oPuzzleBoard.gridHeight; j++) {
			// - - -Check for chain and type matching- - -
			// piece to chain and type match
			if (global.spellData[sp, spellC.PieceToChain] == global.spellData[sp, spellC.SpellType]) {
				if (ds_grid_get(global.pGrid, i, j) == chainCounter) {
					ds_grid_set(global.grid,  i, j, ds_grid_get(global.grid, i, j) + 20);
			
					// Create Chain Sign
					if (!instance_exists(oChainSign)) {
						CreateChainSign(
							GridToWorld(i, "x") + random_range(-5, 5),
							GridToWorld(j, "y") + random_range(-5, 5));
						audio_play_sound(soChain, 0, 0);
							
						// Spawn score point
						var p = instance_create_layer(
							GridToWorld(i, "x") + random_range(-5, 5),
							GridToWorld(j, "y") + random_range(-5, 5),
							"PointsLayer", oPoints);	
						p.pointValue = 1;
					}
				}
			}
			// piece to chain and type dont match
			else {
				if (ds_grid_get(global.pGrid, i, j) == chainCounter) {
					ds_grid_set(global.grid, i, j, global.spellData[sp, spellC.SpellType] + 20);
				
					// Create Chain Sign
					if (!instance_exists(oChainSign)) {
						CreateChainSign(
							GridToWorld(i, "x") + random_range(-5, 5),
							GridToWorld(j, "y") + random_range(-5, 5));
						audio_play_sound(soChain, 0, 0);
							
						// Spawn score point
						var p = instance_create_layer(
							GridToWorld(i, "x") + random_range(-5, 5),
							GridToWorld(j, "y") + random_range(-5, 5),
							"PointsLayer", oPoints);	
						p.pointValue = 1;
					}
				}
			}
		}
	}
	chainCounter++;
	waveCounter--;
	
	// If wave has happened
	if (waveCounter > 0) {
		ShakeScreen(defaultScreenShake, defaultScreenShake);
		PuzzlePieceSound();
	}
	// Trigger the next event in the chain
	alarm[3] = chainSpaceLength;
}
else {
	// Trigger the next event in the chain
	alarm[4] = emptyPieceLength;
}
// Trigger the next event in the chain
alarm[6] = chainSpaceLength;