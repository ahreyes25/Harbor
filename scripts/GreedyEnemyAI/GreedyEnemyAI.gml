/// @description A basic enemy AI that searches for the most powerful potential spell no matter what.

// Calculating the strongest spell
var strongestSpell;
var strongestSpellX;
var strongestSpellY;
var strongestSpellRot;
var strongestSpellFlip;
var maxDam = 0;

// check the grid for each spell in current enemies spell book
for (var i = 0; i < array_length_1d(oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data); i++) {
	// Update spell book index
	oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index = i;
	
	var ind = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index;
	var sp  = oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.data[ind];
	
	// Search through grid for current spell
	for (var j = 0; j < oPuzzleBoard.gridWidth; j++) {
		for (var k = 0; k < oPuzzleBoard.gridHeight; k++) {
			// Move cursor to follow iteration loop
			global.gridIndexX = j;
			global.gridIndexY = k;
				
			// Spell Found!
			if (AICheckSpellForms() != -1) {
				// Check for chain spells
				if (global.spellData[sp, spellC.PieceToChain] != -1) {
					var chainDam = AIComputeChainDamage(j, k);
							
					// Store it, if this avg is greater
					if (chainDam >= maxDam) {
						// Update max damage
						maxDam = chainDam;
							
						// Store spell as current strongest
						strongestSpell		= sp;
						strongestSpellX		= j;
						strongestSpellY		= k;
						strongestSpellRot	= oCombatManager.turnControllerObject.currentPlayerTurn.spellRot;
						strongestSpellFlip	= oCombatManager.turnControllerObject.currentPlayerTurn.spellFlip;
					}	
				}
				// Check for non-chain spells
				else {
					// Compute average potential damage
					var avgDam = (global.spellData[sp, spellC.DamageLow] + global.spellData[sp, spellC.DamageHigh]) / 2;
						
					// Store it, if this avg is greater
					if (avgDam >= maxDam) {
						// Update max damage
						maxDam = avgDam;
							
						// Store spell as current strongest
						strongestSpell		= sp;
						strongestSpellX		= j;
						strongestSpellY		= k;
						strongestSpellRot	= oCombatManager.turnControllerObject.currentPlayerTurn.spellRot;
						strongestSpellFlip	= oCombatManager.turnControllerObject.currentPlayerTurn.spellFlip;
					}	
				}
			}
		}
	}	
}

// Set variables
oCombatManager.turnControllerObject.currentPlayerTurn.searchedForSpell = true;
oCombatManager.turnControllerObject.currentPlayerTurn.spellToCast	  = strongestSpell;
oCombatManager.turnControllerObject.currentPlayerTurn.spellCursorX	  = strongestSpellX;
oCombatManager.turnControllerObject.currentPlayerTurn.spellCursorY	  = strongestSpellY;
oCombatManager.turnControllerObject.currentPlayerTurn.spellRot		  = strongestSpellRot;
oCombatManager.turnControllerObject.currentPlayerTurn.spellFlip		  = strongestSpellFlip;
// rotation and flipping set in AICheckSpellForms();

// Navigate to spell and cast it
if (oCombatManager.turnControllerObject.currentPlayerTurn.alarm[1] == -1)
	oCombatManager.turnControllerObject.currentPlayerTurn.alarm[1] = 10;
oCombatManager.turnControllerObject.currentPlayerTurn.spellBook.index = 0;