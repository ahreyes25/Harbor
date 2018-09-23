if (keyboard_check(vk_enter)) {
	audio_stop_sound(mDialMaeve);
	room_goto_next();
}