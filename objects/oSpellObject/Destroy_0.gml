/// @description Deal Damage
oCombatManager.turnControllerObject.currentPlayerTurn.attackTarget.currentHealth -= oPuzzleBoard.damageToDeal;

var t = instance_create_layer(oCombatManager.turnControllerObject.currentPlayerTurn.attackTarget.x,
							  oCombatManager.turnControllerObject.currentPlayerTurn.attackTarget.y - 10,
							  "PointsLayer", oPoints);
t.pointValue = oPuzzleBoard.damageToDeal * -1;	

// Transition out of attack state to use item state
//oCombatManager.turnControllerObject.currentPlayerTurn.id.state = characterState.usingItem;

// Reset damage
oPuzzleBoard.damageToDeal = 0;