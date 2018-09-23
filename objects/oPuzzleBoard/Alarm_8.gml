/// @description Remove Item When Not Casting A Spell

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set piece to white by adding +10 to their value
for (var i = 0; i < ds_grid_width(global.grid); i++) {
	for (var j = 0; j < ds_grid_height(global.grid); j++) {
		if (ds_grid_get(global.grid, i, j) < 20 && ds_grid_get(global.grid, i, j) >= 10)
			ds_grid_set(global.grid, i, j, ds_grid_get(global.grid, i, j) + 10);
	}
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Asthetic
ShakeScreen(global.spellData[sp, spellC.ScreenShakeSize], global.spellData[sp, spellC.ScreenShakeTime]);
ScreenFlash(global.spellData[sp, spellC.ScreenFlashSize]);
PuzzlePieceSound();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Trigger the next event in the chain
alarm[9] = animationLength;