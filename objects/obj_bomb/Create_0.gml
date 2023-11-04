event_inherited();

static_object = true;
created_by = -1;
damage = 2;
state = BOMB_STATE.OFF;
explosion_in = in_time(timer);
targeted = false;

function on() {
	state = BOMB_STATE.ON;
};