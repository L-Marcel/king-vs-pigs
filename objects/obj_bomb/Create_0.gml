event_inherited();

damage = 2;
danger = false;
state = BOMB_STATE.OFF;
explosion_in = in_time(timer);
targeted = false;

function on() {
	state = BOMB_STATE.ON;
};