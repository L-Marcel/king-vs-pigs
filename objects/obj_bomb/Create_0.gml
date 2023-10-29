event_inherited();

need_layer_changed = false;
created_by = -1;
damage = 2;
state = BOMB_STATE.OFF;
explosion_in = in_time(timer);
targeted = false;

function on() {
	state = BOMB_STATE.ON;
};