if (drawFlash)
	draw_sprite(sThunderFlash, image_index, 0, 0);
	
draw_sprite(sTitle, 0, room_width / 2, room_height / 2);
draw_sprite(sTitleBlue, 0, room_width / 2, (room_height / 2) + (72 / 2) - 1);
draw_set_color(c_white);

if (drawStart)	
	draw_text_transformed(room_width / 2 - 12, (room_height / 2) + (72 / 2) - 20, "Press Start", 0.25, 0.25, 0);