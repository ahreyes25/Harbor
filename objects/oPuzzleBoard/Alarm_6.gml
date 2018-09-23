/// @description Chain Delete Old Links

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Delete old links in the chain
for (var i = 0; i < oPuzzleBoard.gridWidth; i++) {
	for (var j = 0; j < oPuzzleBoard.gridHeight; j++) {
			if (ds_grid_get(global.grid, i, j) >= 20) {
				
				ds_grid_set(global.grid, i, j, 0);	
				
				// Spawn score point
				var p = instance_create_layer(
					GridToWorld(i, "x") + random_range(-5, 5),
					GridToWorld(j, "y") + random_range(-5, 5),
					"PointsLayer", oPoints);	
				p.pointValue = 1;
			}
	}
}