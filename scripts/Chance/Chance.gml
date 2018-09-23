/// @description Determine's if the result is true or false
/// @function ComputeChance
/// @param Percent

var p = argument0;
var r = random_range(0, 100);

if ((r / 100) <= p)
	return true;
else
	return false;