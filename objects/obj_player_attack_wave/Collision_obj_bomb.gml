if(
	obj_not_hitted(other.id) && 
	other.horizontal_speed == 0 && 
	other.state != BOMB_STATE.BOOM
) {
	other.horizontal_speed = impact * image_xscale;
	ds_list_add(hitted_objects, other.id);
	play_sound(snd_hit_ball);
} else if(
	obj_not_hitted(other.id) && 
	other.state != BOMB_STATE.BOOM
) {
	other.horizontal_speed = -other.horizontal_speed * impact;
	ds_list_add(hitted_objects, other.id);
	play_sound(snd_hit_ball, true);
};