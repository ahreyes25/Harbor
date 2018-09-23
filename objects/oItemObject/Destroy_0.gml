/// @description Item Effect

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Potion
if (type == 5) {
	target.currentHealth += 5;
	audio_play_sound(soPotion, 0, 0);
				 
	part_particles_create(heal, target.x, target.y, h, 20);
	alarm[2] = 15;
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Shuffle
else if (type == 6) {
	ShuffleBoard();
	audio_play_sound(soShuffle, 0, 0);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Bottle
else if (type == 7) {
	audio_stop_sound(soBottleRocketClick);
}

// Spawn score point
var p = instance_create_layer(
	GridToWorld(gridX, "x") + random_range(-5, 5),
	GridToWorld(gridY, "y") + random_range(-5, 5),
	"PointsLayer", oPoints);	
p.pointValue = 5;