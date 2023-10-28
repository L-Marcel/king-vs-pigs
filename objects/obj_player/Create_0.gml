event_inherited();

inputs = {
	left : ord("A"),
	right: ord("D"),
	jump: ord("W"),
};

default_jump_button = inputs.jump;

/// @param {Real} _damage
function receive_damage(_damage, _id = id) {
	_id.hitted = true;
	_id.invencible = true;
	_id.life -= _damage;
	_id.sprite_index = sprite_on.damaged;
	_id.image_alpha = 0.75;
};