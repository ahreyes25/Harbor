/// @description 
/*
y = SmoothStep(y, room_height / 2, 0.9);

// Move to half way point
if (y <= room_height / 2 + 16) {
	if (alarm[0] < 0)
		alarm[0] = 45;
}
		
// Exit screen
if (exitScreen)
	y = SmoothStep(y, -75, 0.9);
	
// Destroy
if (y < -8) {
	oTurnController.currentTime = oTurnController.turnTime;
	instance_destroy();
}
*/