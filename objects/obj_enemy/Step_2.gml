event_inherited();

if(hitted && life > 0) { 
	sprite_index = sprite_on.damaged;
} else if(
	dead && 
	(
		alarm[11] != -1 || 
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

if(dead && image_alpha > 0 && image_speed == 0 && sprite_index == sprite_on.dead) {
	image_alpha -= 0.005;
} else if(dead && image_alpha == 0) {
	instance_destroy();
};