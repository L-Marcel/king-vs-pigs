if(obj_not_hitted(other.id)) {
	if(!other.dead && !other.will_dead) {
		other.hitted = true;
		other.life -= damage;
		other.horizontal_speed = impact * 2 * image_xscale;
	};
	ds_list_add(hitted_objects, other.id);
};