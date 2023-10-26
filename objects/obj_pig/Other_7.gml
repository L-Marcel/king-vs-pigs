if(sprite_index == spr_enemy_pig_lighting) {
	with(interacting_with_bomb.id) {
		on();
	};
	change_state(PIG_STATE.RUNNING);
};

event_inherited();