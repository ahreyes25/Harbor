type	= 0;
target	= noone;
gridX   = noone;
gridY   = noone;

itemSound = false;
moveToPlayer = false;
owner = noone;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Particle settings
trail	= part_system_create();
p		= part_type_create();
part_type_shape(p, pt_shape_square);
part_type_size(p, 0.01, 0.02, -0.005, 0.03);
part_type_alpha2(p, 1, 0);
part_type_speed(p, 1, 2, -0.1, 1);
part_type_direction(p, 0, 0, 0, 0);
part_type_orientation(p, 0, 0, 0, 0, 0);
part_type_life(p, 15, 15);
part_type_color1(p, c_white);

heal	= part_system_create();
h		= part_type_create();
part_type_shape(h, pt_shape_square);
part_type_size(h, 0.01, 0.03, -0.005, 0.03);
part_type_alpha2(h, 1, 0);
part_type_speed(h, 1, 3, -0.1, 1);
part_type_direction(h, 70, 110, 0, 10);
part_type_orientation(h, 0, 0, 0, 0, 0);
part_type_life(h, 30, 30);
part_type_color1(h, c_white);