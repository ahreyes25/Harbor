/// @description Shuffle the board to new random values
for (var i = 0; i < oPuzzleBoard.gridWidth; i++) {
	for (var j = 0; j < oPuzzleBoard.gridHeight; j++) {
		ds_grid_set(global.grid, i, j, RandomPiece());
	}
}