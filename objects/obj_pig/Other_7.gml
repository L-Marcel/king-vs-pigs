if(sprite_index == spr_enemy_pig_lighting && state == PIG_STATE.LIGHTING_BOMB) {
	with(interacting_with_bomb.id) {
		on();
	};
	change_state(PIG_STATE.RUNNING);
} else if(sprite_index == spr_enemy_pig_lighting && state == PIG_STATE.LIGHTING_CANNON) {
	with(interacting_with_cannon.id) {
		fire();
	};
	change_state(PIG_STATE.RUNNING);
} else if(sprite_index == sprite_on.attack && state == PIG_STATE.ATTACKING) {
	with_gravity = true;
	change_state(PIG_STATE.IDLE);
};

event_inherited();