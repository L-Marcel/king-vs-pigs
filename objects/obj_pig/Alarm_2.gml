/// @description create attack wave
if(state == PIG_STATE.ATTACKING) {
	var _attack_wave = instance_create_layer(x, y, layer, obj_pig_attack_wave);
	_attack_wave.image_xscale = image_xscale;
	_attack_wave.damage = damage;
	with_gravity = true;
};