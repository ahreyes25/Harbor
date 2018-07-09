if (drawFlash)
	draw_sprite(sThunderFlash, image_index, 0, 0);
	
draw_sprite(sTitle, 0, ViewWidth() / 2, ViewHeight() / 2);
draw_sprite(sTitleBlue, 0, ViewWidth() / 2, (ViewHeight() / 2) + (72 / 2) - 1);
draw_set_color(c_white);

if (drawStart)	
	draw_text_transformed(ViewWidth() / 2 - 12, (ViewHeight() / 2) + (72 / 2) - 20, "Press Start", 0.25, 0.25, 0);