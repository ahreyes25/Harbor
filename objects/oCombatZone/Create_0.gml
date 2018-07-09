decorations = [
	sTree,
];

// Right side 
if (x > ViewWidth() / 2) {
	point1x		= x + 5 ;
	point1y		= y + 10;
	point1depth	= 0; // closest
	
	point2x		= x - 15;
	point2y		= y - 5;
	point2depth = 1; // middle
	
	point3x		= x - 35;
	point3y		= y - 20;
	point3depth = 2; // furthest
}
// Left side
else {
	point1x		= x - 5;
	point1y		= y + 10;
	point1depth = 0; // closest
	
	point2x		= x + 15;
	point2y		= y - 5;
	point2depth = 1; // middle
	
	point3x		= x + 25;	
	point3y		= y - 20;
	point3depth = 2; // furthest
}

landSubimage = irandom_range(0, sprite_get_number(id.sprite_index) - 1);
randomDec	 = decorations[irandom_range(0, array_length_1d(decorations) - 1)];

if (x > ViewWidth() / 2)
	facing = "left";
else
	facing = "right";
	
if (facing == "right")
	image_xscale = 1;
else if (facing == "left")
	image_xscale = -1;
image_yscale = 1;