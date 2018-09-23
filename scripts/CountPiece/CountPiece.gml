/// @description Count how many instances of an element exist in the grid
/// @param PieceToCount

var t = argument0;
var count = 0;

for (var i = 0; i < oPuzzleBoard.gridWidth; i++) {
	for (var j = 0; j < oPuzzleBoard.gridHeight; j++) {
		if (ds_grid_get(global.grid, i, j) == t) {
			count++;
		}
	}
}
return count;