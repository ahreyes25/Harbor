/// @description Animate

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Element animation image_index start at 0
image_index = 0;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set piece to white by adding +10 to their value
for (var i = 0; i < oPuzzleBoard.gridWidth; i++) {
	for (var j = 0; j < oPuzzleBoard.gridHeight; j++) {
		if (ds_grid_get(global.grid, i, j) < 20 && ds_grid_get(global.grid, i, j) >= 10)
			ds_grid_set(global.grid, i, j, ds_grid_get(global.grid, i, j) + 10);
	}
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Asthetic
ShakeScreen(global.spellData[sp, spellC.ScreenShakeSize], global.spellData[sp, spellC.ScreenShakeTime]);
PuzzlePieceSound();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Trigger next event in the chain
alarm[1] = animationLength;