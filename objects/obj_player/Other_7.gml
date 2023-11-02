if(action == PLAYER_ACTION.OUT || action == PLAYER_ACTION.ATTACK) {
	action = PLAYER_ACTION.NONE;
	with_gravity = true;
} else if (action == PLAYER_ACTION.IN) {
	image_alpha = 0;
} else if(dead) {
	image_speed = 0;
};