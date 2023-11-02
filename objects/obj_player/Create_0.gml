event_inherited();

inputs = {
	left : ord("A"),
	right: ord("D"),
	jump: ord("W"),
	attack: ord("J")
};

attack_interval = .5;
can_attack = true;
action = PLAYER_ACTION.OUT;
default_jump_button = inputs.jump;
max_attacks_in_air = 2;
attacks_in_air = max_attacks_in_air;

/// @param {Real} _damage
function receive_damage(_damage, _id = id) {
	if(!_id.hitted) {
		play_sound(snd_damaged);
		_id.hitted = true;
		_id.invencible = true;
		_id.life -= _damage;
		_id.sprite_index = sprite_on.damaged;
		_id.image_alpha = 0.75;
		global.in_transition = false;
	};
};