// Return a random piece into the grid. this is going to be all of the puzzle data

randomize();
var r  = irandom_range(0, 1000); // percentage calculator
var r2 = irandom_range(1, 4);   // normal elements

/*
var items = [
	5, // potion
	6, // shuffle
	7, // bottle
];
*/

// 0.25% chance to get item
/*
if (r >= 970) { // got item
	var r3 = irandom_range(0, array_length_1d(items) - 1);
	return items[r3];
}
else { // no item
*/
return r2;