// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Draw Land
image_speed = 0;
draw_sprite_ext(sLand, landSubimage, x, y, 1, 1, 0, c_white, 1);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Draw random decoration on side closest to edge of the screen
//draw_sprite_ext(randomDec, 0, x - (15 * image_xscale), y, image_xscale, 1, 0, c_white, 1);