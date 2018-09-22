var xx = (0 * oPuzzleBoard.gridPadding) + oPuzzleBoard.gridXOffset - oPuzzleBoard.gridPadding;
var yy = (0 * oPuzzleBoard.gridPadding) + oPuzzleBoard.gridYOffset - oPuzzleBoard.gridPadding;
var ww = oPuzzleBoard.gridWidth			* oPuzzleBoard.gridPadding + oPuzzleBoard.gridPadding;
var hh = oPuzzleBoard.gridHeight		* oPuzzleBoard.gridPadding + oPuzzleBoard.gridPadding;
var mx = ww / 2;
var my = hh / 2;

var b = instance_create_layer(xx + mx, yy + my, "ControllerLayer", oRotatingBoard);
if (first == "board") {
	b.boardSprite	= boardSprite;
	b.menuSprite	= menuSprite;
}
else if (first == "combatMenu") {
	b.boardSprite	= menuSprite;
	b.menuSprite	= boardSprite;
}
b.first				= first;