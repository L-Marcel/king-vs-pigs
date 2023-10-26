event_inherited();

if(hitted && life > 0) { 
	sprite_index = sprite_on.damaged;
} else if(
	dead && 
	(
		(
			alarm[10] != -1 && 
			sprite_index != sprite_on.dead
		) || alarm[11] != -1 || 
		(
			sprite_index != sprite_on.damaged &&
			sprite_index != sprite_on.dead
		)
	)
) {
	sprite_index = sprite_on.damaged;
	alarm[10] = -1;
	alarm[11] = -1;
}; 