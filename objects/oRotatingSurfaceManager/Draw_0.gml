// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Draw Stuff to fill in space as we create surface
if (first == "board") {
	DrawBorder();
	DrawElements();
}
else if (first == "combatMenu") {
	DrawCombatMenu();
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Create surface sprites
var xx = (0 * oPuzzleBoard.gridPadding) + oPuzzleBoard.gridX - oPuzzleBoard.gridPadding;
var yy = (0 * oPuzzleBoard.gridPadding) + oPuzzleBoard.gridY - oPuzzleBoard.gridPadding;
var ww = oPuzzleBoard.gridWidth			* oPuzzleBoard.gridPadding + oPuzzleBoard.gridPadding;
var hh = oPuzzleBoard.gridHeight		* oPuzzleBoard.gridPadding + oPuzzleBoard.gridPadding;

surface = surface_create(ViewWidth(), ViewHeight());
if (!surface_exists(surface)) {
	surface = surface_create(ViewWidth(), ViewHeight());
}
surface_set_target(surface);

draw_clear_alpha(c_black, 0);
DrawBorder();
DrawElements();
boardSprite = sprite_create_from_surface(surface,
				xx, yy, ww, hh, 
				false, false,
				oPuzzleBoard.gridWidth / 2 * oPuzzleBoard.gridPadding,
				hh / 2);

draw_clear_alpha(c_black, 0);
DrawCombatMenu();
menuSprite = sprite_create_from_surface(
				surface,
				(ViewWidth() / 2) - (sprite_get_width(sCombatMenuUI) / 2),
				oPuzzleBoard.gridPadding - 3,
				sprite_get_width(sCombatMenuUI),
				sprite_get_height(sCombatMenuUI) + oPuzzleBoard.gridPadding,
				false, false,
				sprite_get_width(sCombatMenuUI)  / 2,
				sprite_get_height(sCombatMenuUI) / 2);

surface_reset_target();
surface_free(surface);
instance_destroy();