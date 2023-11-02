event_inherited();

state = CANNON_STATE.OFF;
targeted = false;
min_interval = 3;
reloading = false;

function fire() {
	if(!reloading) {
		state = CANNON_STATE.ON;
		reloading = true;
	};
};