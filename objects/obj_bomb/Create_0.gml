event_inherited();

enum BOMB_STATE {
	OFF,
	ON,
	BOOM
};

state = BOMB_STATE.OFF;
explosion_in = in_time(timer);

function on() {
	state = BOMB_STATE.ON;
};