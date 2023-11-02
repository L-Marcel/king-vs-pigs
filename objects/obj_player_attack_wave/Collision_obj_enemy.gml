if(obj_not_hitted(other.id)) {
	if(!other.dead && !other.will_dead) {
		other.hitted = true;
		other.life -= damage;
		other.horizontal_speed = impact * 4 * image_xscale;
		play_sound(snd_enemy_damaged, true);
	};
	ds_list_add(hitted_objects, other.id);
};