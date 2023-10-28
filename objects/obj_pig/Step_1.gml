if(
	hitted && 
	(
		state == PIG_STATE.LIGHTING_BOMB || 
		state == PIG_STATE.LIGHTING_CANNON ||
		state == PIG_STATE.THROWING_BOMB
	)
) {
	change_state(PIG_STATE.RUNNING);
};

event_inherited();

