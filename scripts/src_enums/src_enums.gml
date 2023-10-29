enum PIG_STATE {
	DEAD,
	IDLE,
	RUNNING,
	RUNNING_TO_BOMB,
	LIGHTING_BOMB,
	THROWING_BOMB,
	RUNNING_TO_CANNON,
	LIGHTING_CANNON,
};

enum BOMB_STATE {
	OFF,
	ON,
	BOOM
};

enum CANNON_STATE {
	OFF,
	ON
}

enum DOOR_STATE {
	CLOSING,
	OPENING,
	CLOSED
}

enum PLAYER_ACTION {
	IN,
	OUT,
	NONE
}