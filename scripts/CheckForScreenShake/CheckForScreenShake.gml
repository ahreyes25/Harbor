/// @description Check for the screenshake boolean in order to activate the actual screen shake effect

var s = oCombatManager.cameraControllerObject.shakeSize;

// Screen shake 
if (oCombatManager.cameraControllerObject.shakeScreen) {
	view_xport[0] = random_range(-s, s); //sets the view to a random x position
	view_yport[0] = random_range(-s, s); //sets the view to a random y position
}
// Reset screen
else {
	if view_xport[0] < 0
		view_xport[0] = 0;
		
	if view_xport[0] > 0
		view_xport[0] = 0;
		
	if view_yport[0] < 0
		view_yport[0] = 0;
		
	if view_yport[0] > 0
		view_yport[0] = 0;
}	