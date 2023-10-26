/// @description regeneration / death

if(!dead && life < max_life) {
	life += 1;
	alarm[10] = in_time(regeneration_interval);
} else if(dead) {
	instance_destroy();
};