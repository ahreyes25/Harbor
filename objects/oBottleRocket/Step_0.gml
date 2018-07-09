/// @description Move offscreen
var bottleSpeed = 2;
var tx = WorldToGrid(x, "x", "");
var ty = WorldToGrid(y, "y", "");

var cRed    = make_color_rgb(255, 0, 52);
var cBlue   = make_color_rgb(0, 170, 255);
var cGreen  = make_color_rgb(0, 241, 0);
var cYellow = make_color_rgb(255, 242, 0);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Right
if (dir == "right") {
	if (x < ViewWidth() + 10)
		x+= bottleSpeed;
	y += irandom_range(-1, 1); // shake
	
	// Clear grid as moving past each spot
	if (tx < ds_grid_width(global.grid)) {
		if (ds_grid_get(global.grid, tx, gridY) != 0) {
			// Change color of burst particles
			if (ds_grid_get(global.grid, tx, gridY) mod 10 == 1)
				part_type_color1(eb, cRed);
			else if (ds_grid_get(global.grid, tx, gridY) mod 10 == 2)
				part_type_color1(eb, cBlue);
			else if (ds_grid_get(global.grid, tx, gridY) mod 10 == 3)
				part_type_color1(eb, cGreen);
			else if (ds_grid_get(global.grid, tx, gridY) mod 10 == 4)
				part_type_color1(eb, cYellow);
				
			// Clear grid
			ds_grid_set(global.grid, tx , gridY, 0);
			audio_play_sound(soElementBreak, 0, 0);
			
			// Spawn score point
			var po = instance_create_layer(
				GridToWorld(tx, "x")	+ random_range(-5, 5),
				GridToWorld(gridY, "y") + random_range(-5, 5),
				"PointsLayer", oPoints);	
			po.pointValue = 1;
				
			// Create element burst particles
			part_particles_create(elementBurst, x, y, eb, 30);
		}
	}
		
	// particles
	part_type_direction(p, 180, 180, 0, 15);
	part_particles_create(effect, x, y, p, 50);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Down
else if (dir == "down") {
	if (y < ViewHeight() + 10)
		y+= bottleSpeed;
	x += irandom_range(-1, 1); // shake
	
	// Clear grid as moving past each spot
	if (ty < ds_grid_height(global.grid)) {
		if (ds_grid_get(global.grid, gridX, ty) != 0) {
			// Change color of burst particles
			if (ds_grid_get(global.grid, gridX, ty) mod 10 == 1)
				part_type_color1(eb, cRed);
			else if (ds_grid_get(global.grid, gridX, ty) mod 10 == 2)
				part_type_color1(eb, cBlue);
			else if (ds_grid_get(global.grid, gridX, ty) mod 10 == 3)
				part_type_color1(eb, cGreen);
			else if (ds_grid_get(global.grid, gridX, ty) mod 10 == 4)
				part_type_color1(eb, cYellow);

			// Clear grid
			ds_grid_set(global.grid, gridX , ty, 0);
			audio_play_sound(soElementBreak, 0, 0);
			
			// Spawn score point
			var po = instance_create_layer(
				GridToWorld(gridX, "x")	+ random_range(-5, 5),
				GridToWorld(ty, "y") + random_range(-5, 5),
				"PointsLayer", oPoints);
			po.pointValue = 1;
				
			// Create element burst particles
			part_particles_create(elementBurst, x, y, eb, 30);
		}
	}
		
	// particles
	part_type_direction(p, 90, 90, 0, 15);
	part_particles_create(effect, x, y, p, 50);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Left
else if (dir == "left") {
	if (x > -10)
		x -= bottleSpeed;
	y += irandom_range(-1, 1); // shake
	
	// Clear grid as moving past each spot
	if (tx >= 0) {
		if (ds_grid_get(global.grid, tx, gridY) != 0) {
			// Change color of burst particles
			if (ds_grid_get(global.grid, tx, gridY) mod 10 == 1)
				part_type_color1(eb, cRed);
			else if (ds_grid_get(global.grid, tx, gridY) mod 10 == 2)
				part_type_color1(eb, cBlue);
			else if (ds_grid_get(global.grid, tx, gridY) mod 10 == 3)
				part_type_color1(eb, cGreen);
			else if (ds_grid_get(global.grid, tx, gridY) mod 10 == 4)
				part_type_color1(eb, cYellow);
				
			// Clear grid
			ds_grid_set(global.grid, tx , gridY, 0);
			audio_play_sound(soElementBreak, 0, 0);
			
			// Spawn score point
			var po = instance_create_layer(
				GridToWorld(tx, "x")	+ random_range(-5, 5),
				GridToWorld(gridY, "y") + random_range(-5, 5),
				"PointsLayer", oPoints);
			po.pointValue = 1;
				
			// Create element burst particles
			part_particles_create(elementBurst, x, y, eb, 30);
		}
	}
		
	// particles
	part_type_direction(p, 0, 0, 0, 15);
	part_particles_create(effect, x, y, p, 50);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Up
else if (dir == "up") {
	if (y > -10)
		y-= bottleSpeed;
	x += irandom_range(-1, 1); // shake
	
	// Clear grid as moving past each spot
	if (ty >= 0) {
		if (ds_grid_get(global.grid, gridX, ty) != 0) {
			// Change color of burst particles
			if (ds_grid_get(global.grid, gridX, ty) mod 10 == 1)
				part_type_color1(eb, cRed);
			else if (ds_grid_get(global.grid, gridX, ty) mod 10 == 2)
				part_type_color1(eb, cBlue);
			else if (ds_grid_get(global.grid, gridX, ty) mod 10 == 3)
				part_type_color1(eb, cGreen);
			else if (ds_grid_get(global.grid, gridX, ty) mod 10 == 4)
				part_type_color1(eb, cYellow);
				
			// Clear grid
			ds_grid_set(global.grid, gridX , ty, 0);
			audio_play_sound(soElementBreak, 0, 0);
			
			// Spawn score point
			var po = instance_create_layer(
				GridToWorld(gridX, "x")	+ random_range(-5, 5),
				GridToWorld(ty, "y") + random_range(-5, 5),
				"PointsLayer", oPoints);
			po.pointValue = 1;
				
			// Create element burst particles
			part_particles_create(elementBurst, x, y, eb, 30);
		}
	}
		
	// bottle rocket particles
	part_type_direction(p, 270, 270, 0, 15);
	part_particles_create(effect, x, y, p, 30);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// destroy once out of room
if (x > ViewWidth() ||
	x < 0 ||
	y > ViewHeight() ||
	y < 0) {
		alarm[0] = 120;
		instance_destroy();
	}
	
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set depth 
if (instance_exists(oSpellObject))
	depth = oSpellObject.depth + 1;