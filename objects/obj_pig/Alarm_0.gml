/// @description change state

var _next_state = choose(PIG_STATE.IDLE, PIG_STATE.RUNNING);
	
if(life <= 0 || hitted) {
	_next_state = 0;
};
	
change_state(_next_state);