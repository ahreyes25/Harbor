dir   = noone;
gridX = noone;
gridY = noone;
type  = noone;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Particle settings
effect	= part_system_create();
p		= part_type_create();
part_type_shape(p, pt_shape_square);
part_type_size(p, 0.01, 0.02, -0.005, 0.03);
part_type_alpha2(p, 1, 0);
part_type_speed(p, 4, 6, -0.1, 1);
part_type_direction(p, 0, 0, 0, 0);
part_type_orientation(p, 0, 0, 0, 0, 0);
part_type_life(p, 60, 60);
part_type_color1(p, c_white);

elementBurst = part_system_create();
eb			 = part_type_create();
part_type_shape(eb, pt_shape_square);
part_type_size(eb, 0.01, 0.01, -0.005, 0.03);
part_type_alpha2(eb, 1, 0);
part_type_speed(eb, 1, 2, -0.1, 0);
part_type_direction(eb, 0, 360, 0, 10);
part_type_orientation(eb, 0, 0, 0, 0, 0);
part_type_life(eb, 60, 60);

audio_play_sound(soBottleRocket, 0, 0);