/// @description Get user input

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Get keyboard input 
leftPressed		= keyboard_check_pressed(ord("A"));
upPressed		= keyboard_check_pressed(ord("W"));
rightPressed	= keyboard_check_pressed(ord("D"));
downPressed		= keyboard_check_pressed(ord("S"));
left			= keyboard_check(ord("A"));
up				= keyboard_check(ord("W"));
right			= keyboard_check(ord("D"));
down			= keyboard_check(ord("S"));
action1Pressed	= keyboard_check_pressed(ord("J"));
action2Pressed	= keyboard_check_pressed(ord("K"));
action3Pressed  = keyboard_check_pressed(ord("L"));
rotateRight		= keyboard_check_pressed(ord("I"));
rotateRightHold = keyboard_check(ord("I"));
rotateLeft		= keyboard_check_pressed(ord("U"));
rotateLeftHold  = keyboard_check(ord("U"));
flip			= keyboard_check_pressed(ord("O"));
flipHold		= keyboard_check(ord("O"));

restart = keyboard_check_pressed(ord("R"));
back	= keyboard_check_pressed(ord("B"));
if (restart) {
	audio_stop_all();
	room_restart();
}
if (back) {
	audio_stop_all();
	audio_play_sound(mDialMaeve, 0, 1);
	room_goto_previous();
}