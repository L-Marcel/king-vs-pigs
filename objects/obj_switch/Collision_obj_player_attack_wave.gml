if(state == SWITCH_STATE.LEFT) {
	state = SWITCH_STATE.CHANGING;
	global.switchs--;
	
	if(global.switchs <= 0) {
		if(global.end_door && global.end_door.state == DOOR_STATE.LOCKED) {
			global.in_transition = false;
			with(global.end_door) {
				unlock();
			};
		};
	};
};