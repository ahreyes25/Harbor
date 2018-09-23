if (pointValue != noone) {
	if (pointValue >= 0) {
		var c = c_white;
		draw_text_transformed_color(x, y, "+" + string(pointValue), 0.4, 0.4, 0, c, c, c, c, image_alpha);
	}
	else {
		var c = c_red;
		draw_text_transformed_color(x, y, string(pointValue), 0.4, 0.4, 0, c, c, c, c, image_alpha);
	}
}