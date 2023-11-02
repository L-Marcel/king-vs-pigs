/// @description change state

var _next_state = choose(PIG_STATE.IDLE, PIG_STATE.RUNNING);
	
if(life <= 0) {
	will_dead = true;
	with_gravity = true;
};
	
change_state(_next_state);