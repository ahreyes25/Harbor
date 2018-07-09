// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Check if spell is moving across the screen
if (global.spellData[sp, spellC.Stationary] == "right") 
	if (self.x < ViewWidth() / 2) // caster on left side
		x += global.spellData[sp, spellC.TravelSpeed];
	else // flip direction for p2 or enemy
		x -= global.spellData[sp, spellC.TravelSpeed]; 
else if (global.spellData[sp, spellC.Stationary] == "left") 
	if (self.x < ViewWidth() / 2) // caster on right side
		x -= global.spellData[sp, spellC.TravelSpeed];
	else // flip direction for p2 or enemy
		x += global.spellData[sp, spellC.TravelSpeed];
else if (global.spellData[sp, spellC.Stationary] == "up") 
	y -= global.spellData[sp, spellC.TravelSpeed];
else if (global.spellData[sp, spellC.Stationary] == "down") 
	y += global.spellData[sp, spellC.TravelSpeed];
	
depth = -1000;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Delete once out of room
if (x > ViewWidth() || x < -64 || y < - 64 || y > ViewHeight())
	instance_destroy();