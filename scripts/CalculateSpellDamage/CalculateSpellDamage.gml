/// @description Gather spell low and high damage and randomly compute a value between that range

var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

var l = global.spellData[sp, spellC.DamageLow];
var h = global.spellData[sp, spellC.DamageHigh];

randomize();
return (irandom_range(l, h));