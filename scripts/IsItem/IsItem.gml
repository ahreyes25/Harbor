/// @description Checks to see if piece at current index is an item

/// @param iIndex to check
/// @param jIndex to check

var i = argument0;
var j = argument1;

var piece = ds_grid_get(global.grid, i, j) mod 10;

if (piece > 4 && piece < 10)
	return true;
else
	return false;