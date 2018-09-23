// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Draw each corner of the spell board border

var centerConstantX = room_width / 2 - 1;
var centerConstantY = 28;
var xCornerOffset	= oPuzzleBoard.gridWidth  * oPuzzleBoard.gridPadding / 2;
var yCornerOffset	= oPuzzleBoard.gridHeight * oPuzzleBoard.gridPadding / 2;

// Top left
draw_sprite_ext(sGridBorderTopLeft,		0, centerConstantX - xCornerOffset - 1, centerConstantY - yCornerOffset, 1, 1, 0, c_white, 1);

// Top right	
draw_sprite_ext(sGridBorderTopRight,	0, centerConstantX + xCornerOffset,		centerConstantY - yCornerOffset, 1, 1, 0, c_white, 1);

// Bottom left
draw_sprite_ext(sGridBorderBottomLeft,	0, centerConstantX - xCornerOffset - 1, centerConstantY + yCornerOffset, 1, 1, 0, c_white, 1);

// Bottom right
draw_sprite_ext(sGridBorderBottomRight,	0, centerConstantX + xCornerOffset,		centerConstantY + yCornerOffset, 1, 1, 0, c_white, 1);