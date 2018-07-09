/// @description Converts world position to grid position

///  @param coord value to convert
///  @param xOrY if value is an x or y coordinate
///  @param round which direction to round, if any

var coord = argument0;
var xOrY  = argument1; 
var r	  = argument2;
var v;

// get value
if (xOrY == "x")
	v = ((coord - oPuzzleBoard.gridX) / oPuzzleBoard.gridPadding);
else if (xOrY == "y")
	v = ((coord - oPuzzleBoard.gridYO) / oPuzzleBoard.gridPadding);	

// do roounding
if (r == "down")
	return floor(v);
else if (r == "up")
	return ceil(v);
else 
	return v;