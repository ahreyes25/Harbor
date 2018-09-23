// Center sprite
sprite_set_offset(sprite_index, sprite_get_width(sprite_index) / 2, sprite_get_height(sprite_index) / 2);

sprite_index = boardSprite;

// Hide and Show sprite
if (t >= 3250) {
	instance_destroy();
}
else {
	visible = true;	
	ShakeScreen(2, 10);
	
	if (t >= 0 && t < 1650) {
		sprite_index = boardSprite;
		image_xscale = cos(t / 1000);
		t += rotSpeed;
	}
	else {
		t -= rotSpeed;
		sprite_index = menuSprite;
		image_xscale = cos(t / 1000) * -1;
		t += rotSpeed * 2;
	}
}