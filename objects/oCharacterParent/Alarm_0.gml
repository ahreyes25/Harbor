switch(state) {
	#region // Hurt
	case characterState.hurt:
		state = characterState.waiting;
	break;
	#endregion
	
	#region // Attacking
	case characterState.attacking:
		if (instance_exists(oSpellObject))
			alarm[0] = 1;
		else
			state = characterState.usingItem;
	break;
	#endregion
}