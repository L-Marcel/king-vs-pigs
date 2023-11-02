if(
	hitted && 
	(
		state == PIG_STATE.LIGHTING_BOMB || 
		state == PIG_STATE.LIGHTING_CANNON ||
		state != PIG_STATE.RUNNING
	) && state != PIG_STATE.IDLE
) {
	change_state(PIG_STATE.IDLE);
};

event_inherited();

