/// @description Uses a priority grid/graph to recursively check for connecting chain pieces.
//  @param WaveIteration
//  @param PieceToChain

var w = argument0;
var c = argument1; // piece to chain

var ww = oPuzzleBoard.gridWidth;
var hh = oPuzzleBoard.gridHeight;

waveCounter++;

var cont = false;

for (var i = 0; i < ww; i++) {
	for (var j = 0; j < hh; j++) {
		if (ds_grid_get(global.pGrid, i, j) == (w - 1)) {
			// Check left
			if (i - 1 >= 0) { // check for index out of bounds
				if (ds_grid_get(global.pGrid, i - 1, j) == -1 && // check for no priority
					ds_grid_get(global.grid,  i - 1, j) == c) {  // check for right chain
						ds_grid_set(global.pGrid, i - 1, j, w);	
						cont = true;
				}
			}
			
			// Check right
			if (i + 1 <= oPuzzleBoard.gridWidth - 1) { // check for index out of bounds
				if (ds_grid_get(global.pGrid, i + 1, j) == -1 && // check for no priority
					ds_grid_get(global.grid,  i + 1, j) == c) {  // check for right chain
						ds_grid_set(global.pGrid, i + 1, j, w);
						cont = true;
				}
			}

			// Check up
			if (j - 1 >= 0) { // check for index out of bounds
				if (ds_grid_get(global.pGrid, i, j - 1) == -1 && // check for no priority
					ds_grid_get(global.grid,  i, j - 1) == c) {  // check for right chain
						ds_grid_set(global.pGrid, i, j - 1, w);
						cont = true;
				}
			}
			
			// Check down
			if (j + 1 <= oPuzzleBoard.gridHeight - 1) { // check for index out of bounds
				if (ds_grid_get(global.pGrid, i, j + 1) == -1 && // check for no priority
					ds_grid_get(global.grid,  i, j + 1) == c) {  // check for right chain
						ds_grid_set(global.pGrid, i, j + 1, w);	
						cont = true;
				}
			}
		}
	}
}

if (cont) Wave(w + 1, c);