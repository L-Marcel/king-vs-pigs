if(
	hitted && 
	(
		state == PIG_STATE.ATTACKING ||
		state != PIG_STATE.RUNNING
	) && state != PIG_STATE.IDLE
) {
	change_state(PIG_STATE.IDLE);
};

event_inherited();

