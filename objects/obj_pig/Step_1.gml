if(
	hitted && 
	(
		state == PIG_STATE.LIGHTING_BOMB || 
		state == PIG_STATE.LIGHTING_CANNON ||
		state == PIG_STATE.ATTACKING ||
		state != PIG_STATE.RUNNING
	)
) {
	change_state(PIG_STATE.IDLE);
};

event_inherited();

