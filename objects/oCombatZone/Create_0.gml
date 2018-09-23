decorations = [
	sTree,
];

point1 = x - 8;
point2 = x;
point3 = x + 8;

landSubimage = irandom_range(0, sprite_get_number(id.sprite_index) - 1);
randomDec	 = decorations[irandom_range(0, array_length_1d(decorations) - 1)];

if (x > room_width / 2)
	facing = "left";
else
	facing = "right";
	
if (facing == "right")
	image_xscale = 1;
else if (facing == "left")
	image_xscale = -1;
image_yscale = 1;