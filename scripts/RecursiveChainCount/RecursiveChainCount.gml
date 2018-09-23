/// @description Recursively Counts The Damage Current Spell Will Do With Chaining
/// @function RecursiveChainCount
/// @param xIndex
/// @param yIndex
/// @param chainGrid

var xx	= argument0; // x position of current index
var yy	= argument1; // y position of current index
var cg  = argument2;
var g	= global.grid;
var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp	= oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

// If piece to chain and spell type are the same
var st  = global.spellData[sp, spellC.SpellType];
if (global.spellData[sp, spellC.PieceToChain] != -1)
	var ptc = global.spellData[sp, spellC.PieceToChain];
else
	var ptc = st;

// check if current spot is our chain piece
if (ds_grid_get(g, xx, yy) == ptc || ds_grid_get(g, xx, yy) == st || IsItem(xx, yy)) {
	ds_grid_set(cg, xx, yy, ptc);
	oCombatManager.turnControllerObject.currentPlayerTurn.chainCount++;
	
	// Good to keep going
	// Check left
	if (xx - 1 >= 0) {
		if (ds_grid_get(g, xx - 1, yy) == ptc || ds_grid_get(g, xx - 1, yy) == st)
			if (ds_grid_get(cg, xx - 1, yy) != ptc) {
				RecursiveChainCount(xx - 1, yy, cg);
			}
	}
	// Check right 
	if (xx + 1 <= oPuzzleBoard.gridWidth - 1) {
		if (ds_grid_get(g, xx + 1, yy) == ptc || ds_grid_get(g, xx + 1, yy) == st)
			if (ds_grid_get(cg, xx + 1, yy) != ptc) {
				RecursiveChainCount(xx + 1, yy, cg);
			}
	}
	// Check up
	if (yy - 1 >= 0) {
		if (ds_grid_get(g, xx, yy - 1) == ptc || ds_grid_get(g, xx, yy - 1) == st)
			if (ds_grid_get(cg, xx, yy - 1) != ptc) {
				RecursiveChainCount(xx, yy - 1, cg);
			}
	}
	// Check down
	if (yy + 1 <= oPuzzleBoard.gridHeight - 1) {
		if (ds_grid_get(g, xx, yy + 1) == ptc || ds_grid_get(g, xx, yy + 1) == st)
			if (ds_grid_get(g, xx, yy + 1) != ptc) {
				RecursiveChainCount(xx, yy + 1, cg);
			}
	}
	return;	
}
else
	return;