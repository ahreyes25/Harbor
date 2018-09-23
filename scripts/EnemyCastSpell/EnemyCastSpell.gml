/// @param spellToCast
/// @param cursorX
/// @param cursorY

var stc = argument0;
var sxx = argument1;
var syy = argument2;

var coords	= [[]];
var items	= [0, 0, 0, 0, 0]; // is the size of the largest spell, in this case: fireball
var cast	= false;
var item	= false;
var cursorX = sxx;
var cursorY = syy;
var g = global.grid;

var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

switch (stc) {
	// Single
	case 0: 
		coords = [
			[cursorX, cursorY]
		];
			
		// Check for basic or item
		cast = true;
		for (var i = 0; i < array_length_2d(coords, 0); i++){
			var c = coords[0, i];
			if (IsItem(c[0], c[1])) { // allow items
				cast = false;
				for (var k = 0; k < array_length_1d(items); k++) // add item to list
					if (items[k] == 0)	{
						items[k] = ds_grid_get(g, c[0], c[1]); 
						item = true;
					}
					
			}
		}
	break;
			
	// Fireball
	case 1: 
		coords = [
			[cursorX + 1, cursorY    ],
			[cursorX,     cursorY + 1],
			[cursorX + 1, cursorY + 1],
			[cursorX + 2, cursorY + 1],
			[cursorX + 1, cursorY + 2],
		];

		// Check Spell: check for all fires
		var pass = true;
		for (var i = 0; i < array_length_2d(coords, 0); i++){
			var c = coords[0, i];
			if (ds_grid_get(g, c[0], c[1]) != 1) {
				if (IsItem(c[0], c[1])) { // allow items
					for (var k = 0; k < array_length_1d(items); k++) // add item to list
						if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
					continue;
				}
				pass = false;
			}
		}	
			
		// If Valid
		if (pass)
			cast = true;
	break;
			
	// elemental
	case 2: 
		coords = [
			[cursorX,     cursorY    ],
			[cursorX + 1, cursorY    ],
			[cursorX,     cursorY + 1],
			[cursorX + 1, cursorY + 1],
		];
				
		// Check Spell: check for one of each
		var red    = false;
		var blue   = false;
		var green  = false;
		var yellow = false;
		for (var i = 0; i < array_length_2d(coords, 0); i++){
			var c = coords[0, i];
			if (ds_grid_get(g, c[0], c[1]) == 1 || IsItem(c[0], c[1])) // ignore items
				red = true;
			if (ds_grid_get(g, c[0], c[1]) == 2 || IsItem(c[0], c[1])) // ignore items
				blue = true;
			if (ds_grid_get(g, c[0], c[1]) == 3 || IsItem(c[0], c[1])) // ignore items
				green = true;
			if (ds_grid_get(g, c[0], c[1]) == 4 || IsItem(c[0], c[1])) // ignore items
				yellow = true;
		}
			
		// Check for Item
		for (var i = 0; i < array_length_2d(coords, 0); i++){
			var c = coords[0, i];
			if (IsItem(c[0], c[1])) { // allow items
				for (var k = 0; k < array_length_1d(items); k++) // add item to list
					if (items[k] == 0)	{
						items[k] = ds_grid_get(g, c[0], c[1]); 
						item = true;
					}
			}
		}
			
		// If Valid
		if (red && blue && green && yellow)
			cast = true;
	break;
			
	// lightningBolt
	case 3: 
		// Check rotation Orientation
		if (global.spellData[sp, spellC.FlipOrientation] == 1) { // not flipped
			switch(global.spellData[sp, spellC.Orientation]) { // rotated
				case 0: // rotated 0
					coords = [
						[cursorX,     cursorY + 1],
						[cursorX + 1, cursorY + 1],
						[cursorX + 1, cursorY    ],
						[cursorX + 2, cursorY    ],
					];
				break;
				case 90: // rotated 90
					coords = [
						[cursorX,	  cursorY	 ],
						[cursorX,	  cursorY + 1],
						[cursorX + 1, cursorY + 1],
						[cursorX + 1, cursorY + 2],
					];
				break;
				case 180: // rotated 180
					coords = [
						[cursorX,     cursorY + 1],
						[cursorX + 1, cursorY + 1],
						[cursorX + 1, cursorY    ],
						[cursorX + 2, cursorY    ],
					];
				break;
				case 270: // rotate 270
					coords = [
						[cursorX,	  cursorY	 ],
						[cursorX,	  cursorY + 1],
						[cursorX + 1, cursorY + 1],
						[cursorX + 1, cursorY + 2],
					];
				break;
			}
		}
		else if (global.spellData[sp, spellC.FlipOrientation] == -1) { // flipped	
			switch(global.spellData[sp, spellC.Orientation]) { // rotated
				case 0: // rotated 0 and flipped
					coords = [
						[cursorX,     cursorY],
						[cursorX + 1, cursorY + 1],
						[cursorX + 1, cursorY    ],
						[cursorX + 2, cursorY + 1],
					];
				break;
				case 90: // rotated 90 and flipped
					coords = [
						[cursorX + 1, cursorY	 ],
						[cursorX,	  cursorY + 1],
						[cursorX + 1, cursorY + 1],
						[cursorX,	  cursorY + 2],
					];
				break;
				case 180: // rotated 180 and flipped
					coords = [
						[cursorX,     cursorY	 ],
						[cursorX + 1, cursorY	 ],
						[cursorX + 1, cursorY + 1],
						[cursorX + 2, cursorY + 1],
					];
				break;
				case 270: // rotate 270 and flipped
					coords = [
						[cursorX + 1, cursorY	 ],
						[cursorX,	  cursorY + 1],
						[cursorX + 1, cursorY + 1],
						[cursorX,     cursorY + 2],
					];
				break;
			}
		}

		// Check Spell: check for all electric
		var pass = true;
		for (var i = 0; i < array_length_2d(coords, 0); i++){
			var c = coords[0, i];
			if (ds_grid_get(g, c[0], c[1]) != 4) {
				if (IsItem(c[0], c[1])) { // allow items
					for (var k = 0; k < array_length_1d(items); k++) // add item to list
						if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
					continue;
				}
				pass = false;
			}
		}
			
		//If Valid
		if (pass)
			cast = true;
	break;
			
	// sprout
	case 4:
		coords = [
			[cursorX,     cursorY],
			[cursorX + 2, cursorY],
			[cursorX + 1, cursorY + 1],
		];
			
		// Check Spell: check for all grass
		var pass = true;
		for (var i = 0; i < array_length_2d(coords, 0); i++){
			var c = coords[0, i];
			if (ds_grid_get(g, c[0], c[1]) != 3) {
				if (IsItem(c[0], c[1])) { // allow items
					for (var k = 0; k < array_length_1d(items); k++) // add item to list
						if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
					continue; // if item, continue to check next iteration
				}
				pass = false;
			}
		}
			
		//If Valid
		if (pass)
			cast = true;
	break;
		
	// tsunami
	case 5:
		if (global.spellData[sp, spellC.FlipOrientation] == 1) {
			coords = [
				[cursorX,	  cursorY],
				[cursorX + 1, cursorY],
				[cursorX,	  cursorY + 1]
			];
		}
		else if (global.spellData[sp, spellC.FlipOrientation] == -1) {
			coords = [
				[cursorX,	  cursorY],
				[cursorX + 1, cursorY],
				[cursorX + 1, cursorY + 1]
			];
		}
			
		// Check Spell: check for all waters
		var pass = true;
		for (var i = 0; i < array_length_2d(coords, 0); i++){
			var c = coords[0, i];
			if (ds_grid_get(g, c[0], c[1]) != 2) {
				if (IsItem(c[0], c[1])) { // allow items
					for (var k = 0; k < array_length_1d(items); k++) // add item to list
						if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
					continue;
				}
				pass = false;
			}
		}
			
		//If Valid
		if (pass)
			cast = true;
	break;
		
	// brushfire
	case 6:
		// check rotation orientation
		switch(global.spellData[sp, spellC.Orientation]) {
			case 0:
				coords = [
					[cursorX,	  cursorY],
					[cursorX + 1, cursorY],
					[cursorX + 2, cursorY]
				];
			break;
			case 90:
				coords = [
					[cursorX,	  cursorY],
					[cursorX, cursorY + 1],
					[cursorX, cursorY + 2]
				];
			break;
			case 180:
				coords = [
					[cursorX,	  cursorY],
					[cursorX + 1, cursorY],
					[cursorX + 2, cursorY]
				];
			break;
			case 270:
				coords = [
					[cursorX,	  cursorY],
					[cursorX, cursorY + 1],
					[cursorX, cursorY + 2]
				];
			break;
		}
			
		// Check Spell: check for fire grass fire
		var pass = false;
		var c = coords[0, 0];
		if (ds_grid_get(g, c[0], c[1]) == 1 || IsItem(c[0], c[1])) { // ignore items
			if (IsItem(c[0], c[1])) { // allow items
				for (var k = 0; k < array_length_1d(items); k++) // add item to list
					if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
			}
			c = coords[0, 1];
			if (ds_grid_get(g, c[0], c[1]) == 3 || IsItem(c[0], c[1])) { // ignore items
				if (IsItem(c[0], c[1])) { // allow items
					for (var k = 0; k < array_length_1d(items); k++) // add item to list
						if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
				}
				c = coords[0, 2];
				if (ds_grid_get(g, c[0], c[1]) == 1 || IsItem(c[0], c[1])) { // ignore items
					if (IsItem(c[0], c[1])) { // allow items
						for (var k = 0; k < array_length_1d(items); k++) // add item to list
							if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
					}
					pass = true;
				}
			}
		}
			
		//If Valid
		if (pass)
			cast = true;
	break;
		
	// thunderstorm
	case 7:
		coords = [
			[cursorX,	  cursorY],
			[cursorX, cursorY + 1],
		];
			
		// Check Spell: check for fire grass fire
		var pass = false;
		var c = coords[0, 0];
		if (ds_grid_get(g, c[0], c[1]) == 4 || IsItem(c[0], c[1])) { // ignore items
			if (IsItem(c[0], c[1])) { // allow items
				for (var k = 0; k < array_length_1d(items); k++) // add item to list
					if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
			}
			c = coords[0, 1];
			if (ds_grid_get(g, c[0], c[1]) == 2 || IsItem(c[0], c[1])) { // ignore items
				if (IsItem(c[0], c[1])) { // allow items
					for (var k = 0; k < array_length_1d(items); k++) // add item to list
						if (items[k] == 0)	{
							items[k] = ds_grid_get(g, c[0], c[1]); 
							item = true;
						}
				}
				pass = true;
			}
		}
			
		//If Valid
		if (pass)
			cast = true;
	break;
}

//-----------------------------------------
// Cast Spell
if (cast)
	CastSpell(coords);
	
// Use item
if (item)
	UseItem(items, coords, cast); // pass items array, coordinates array, and check if we cast a spell