/// @description Create chain sign above puzzle elements
/// @param x
/// @param y

var xx = argument0;				// x position where to create chain sign
var yy = argument1;				// y position where to create chain sign
var rr = random_range(-2, 2);	// x & y random offset for variability

var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

// Set chain sign color
// If piece to chain and type match, then show piece to chain color
if (global.spellData[sp, spellC.PieceToChain] == global.spellData[sp, spellC.SpellType])
	var ptc = global.spellData[sp, spellC.PieceToChain];
// If piece to chain and type dont match, then show spell type color
else 
	var ptc = global.spellData[sp, spellC.SpellType];

switch(ptc) {
	case 1:
		var p = instance_create_layer(xx - 4 + rr, yy - 4 + rr, "PointsLayer", oChainSign);
		p.sprite_index = sChainR;
	break;
	case 2:
		var p = instance_create_layer(xx - 4 + rr, yy - 4 + rr, "PointsLayer", oChainSign);
		p.sprite_index = sChainB;
	break;
	case 3:
		var p = instance_create_layer(xx - 4 + rr, yy - 4 + rr, "PointsLayer", oChainSign);
		p.sprite_index = sChainG;
	break;
	case 4:
		var p = instance_create_layer(xx - 4 + rr, yy - 4 + rr, "PointsLayer", oChainSign);
		p.sprite_index = sChainY;
	break;
}