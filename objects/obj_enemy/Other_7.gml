if(dead && sprite_index == sprite_on.damaged && sprite_index != sprite_on.dead) {
	sprite_index = sprite_on.dead;
} else if(dead && sprite_index == sprite_on.dead) {
	image_speed = 0;
	image_index = image_number - 1;
	alarm[10] = in_time(10);
};