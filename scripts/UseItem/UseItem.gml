/// @param itemsArray
/// @param coordsArray
/// @param castBoolean

var items  = argument0;
var coords = argument1;
var cast   = argument2;

// ItemsToUse is owned by the oPlayerTurn object for its reference
oPuzzleBoard.itemsToUse = items; 

var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

// If the spell consumes the item
if (cast) {
	// Create item object
	for (var i = 0; i < array_length_2d(coords, 0); i++) {
		var c = coords[0, i];
		// check if item
		if (IsItem(c[0], c[1])) {
			var it = instance_create_layer(
				GridToWorld(c[0], "x"), GridToWorld(c[1], "y"),
				"PointsLayer", oItemObject);
			it.type   = ds_grid_get(global.grid, c[0], c[1]) mod 10;
			it.target = oCombatManager.turnControllerObject.currentPlayerTurn;
			it.owner  = oCombatManager.turnControllerObject.currentPlayerTurn;
			it.gridX  = c[0];
			it.gridY  = c[1];;
			show_message(it.target);
		}
	}
}
// If the spell does not consume the item
else {
	// Only if a basic spell
	if (global.spellData[sp, spellC.SpellID] == 0) {
		// Create item object
		for (var i = 0; i < array_length_2d(coords, 0); i++) {
			var c = coords[0, i];
			// check if item
			if (IsItem(c[0], c[1])) {
				var it = instance_create_layer(
					GridToWorld(c[0], "x"), GridToWorld(c[1], "y"),
					"PointsLayer", oItemObject);
				it.type   = ds_grid_get(global.grid, c[0], c[1]) mod 10;
				it.target = oCombatManager.turnControllerObject.currentPlayerTurn;
				it.owner  = oCombatManager.turnControllerObject.currentPlayerTurn;
				it.gridX  = c[0];
				it.gridY  = c[1];
			}
		}
		
		audio_play_sound(soSelectSpell, 0, 0);
			
		// Animate Puzzle Piece
		for (var i = 0; i < array_length_2d(coords, 0); i++) {
			var c = coords[0, i];
			if (IsItem(c[0], c[1]))
				ds_grid_set(global.grid, c[0], c[1], ds_grid_get(global.grid, c[0], c[1]) + 10);
		}	
			
		if (oPuzzleBoard.alarm[8] == -1)
			oPuzzleBoard.alarm[8] = oPuzzleBoard.whitePieceLength;
	}
}

if (oCombatManager.turnControllerObject.currentPlayerTurn.id.state == characterState.idle)
	oCombatManager.turnControllerObject.currentPlayerTurn.id.state = characterState.usingItem;