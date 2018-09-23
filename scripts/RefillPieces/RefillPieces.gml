/// @description Once pieces are deleted refill them by shifting pieces
// down and creating new random pieces at the top

var g = global.grid;
randomize();

// Set grid to slide values down
for (var i = oPuzzleBoard.gridWidth - 1; i >= 0; i--){ // loop through grid
	for (var j = oPuzzleBoard.gridHeight - 1; j >= 0; j--){
		if (ds_grid_get(g, i, j) == 0){ // empty in current index
			// check for all emptys above current index
			var empty = true;
			var k = j - 1;
			var l;
			while (k >= 0){ // search for pieces above
				if (ds_grid_get(g, i, k) != 0){ // if there is a piece above
					empty = false;
					l = k; // store index where non-empty piece exists
					break;
				}
				else
					k--;
			}
			k = j; // reset k to current index
			if (!empty){ // shift everything down
				while (l >= 0){
					ds_grid_set(g, i, k, ds_grid_get(g, i, l));	 // set k to l
					ds_grid_set(g, i, l, RandomPiece()); // set l to random
					l--;
					k--;
				}
			}
			else{ // if empty, fill all above with randoms
				while (k >= 0){
					ds_grid_set(g, i, k, RandomPiece());
					k--;
				}
			}
		}
	}
}