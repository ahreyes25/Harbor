/// @description Converts grid position to world position

///  @param coord value to convert
///  @param xOrY if value is an x or y coordinate

var coord = argument0;
var xOrY  = argument1; 

if (xOrY == "x")
	return ((coord * oPuzzleBoard.gridPadding) + oPuzzleBoard.gridXOffset);
else if (xOrY == "y")
	return ((coord * oPuzzleBoard.gridPadding) + oPuzzleBoard.gridYOffset);