// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Check For Death Conditions
if (currentHealth <= 0)
	instance_destroy();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Character Combat States
CombatCharacterStates();