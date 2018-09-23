/// @description Flip spell when in spell book only if specific spell allows for flipping
Input();

var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
var sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];

if (oCombatManager.combatMenu.inSpellBook) {
	if (flip && global.spellData[sp, spellC.CanFlip]) {
		audio_play_sound(soFlipSpell, 0, 0);
		global.spellData[sp, spellC.FlipOrientation] *= -1;	
	}
}