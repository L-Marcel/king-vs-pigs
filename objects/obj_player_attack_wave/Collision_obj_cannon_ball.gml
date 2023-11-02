if(obj_not_hitted(other.id)) {
	other.horizontal_speed = -other.horizontal_speed * impact;
	ds_list_add(hitted_objects, other.id);
	play_sound(snd_hit_ball, true);
};