state = CANNON_STATE.OFF;
interval = 6;
reloading = false;

function fire() {
	if(!reloading) {
		state = CANNON_STATE.ON;
		reloading = true;
	};
};