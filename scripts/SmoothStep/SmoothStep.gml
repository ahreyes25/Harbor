/// @description linear interpolation
/// @param start position
/// @param end position
/// @param inverse speed

var st		= argument0;
var en		= argument1;
var sp		= argument2;
return ((st * sp) + (en * (1 - sp)));