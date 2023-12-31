can_down_ground = keyboard_check(inputs.down);

audio_listener_position(x, y, 0);

var _left, _right;

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);

horizontal_speed = (_right - _left);

var _jumpped_in_a_head = false;
if(vertical_speed > 0 && !hitted) {
	var _enemy = instance_place(x, y + 1, obj_enemy);
	
	if(_enemy && !_enemy.hitted) {
		_jumpped_in_a_head = true;
		try_jump(false, inputs.jump, true);
		_enemy.hitted = true;
		_enemy.head_hitted = true;
		_enemy.life -= damage / 1.5;
		play_sound(snd_enemy_damaged,,1.5);
	};
};

event_inherited();

var _enemy = instance_place(x, y, obj_enemy);

if(!invencible && !hitted && _enemy && !_jumpped_in_a_head && !_enemy.dead) {
	receive_damage(_enemy.damage);
} else if(hitted) {
	sprite_index = sprite_on.damaged;
	
	with_gravity = false;
	horizontal_speed = 0;
	if(alarm[11] == -1) {
		alarm[11] = in_time(invencibility_duration * .15);
	};
} else if(!hitted && invencible && alarm[10] == -1) {
	alarm[10] = in_time(invencibility_duration * .85);
};

if(
	keyboard_check(inputs.attack) && 
	action == PLAYER_ACTION.NONE &&
	can_attack &&
	attacks_in_air > 0
) {
	action = PLAYER_ACTION.ATTACK;
	can_attack = false;
	play_sound(snd_player_attack);
	alarm[9] = in_time(attack_interval);
	attacks_in_air--;
	
	var _attack_wave = instance_create_layer(x, y, layer, obj_player_attack_wave);
	_attack_wave.damage = damage;
	_attack_wave.image_xscale = image_xscale;
};

if(alarm[11] != -1 && action == PLAYER_ACTION.ATTACK) {
	action = PLAYER_ACTION.NONE;
};

switch(action) {
	case PLAYER_ACTION.OUT:
		sprite_index = spr_player_out;
		horizontal_speed = 0;
		vertical_speed = 0;
		break;
	case PLAYER_ACTION.IN:
		sprite_index = spr_player_in;
		horizontal_speed = 0;
		vertical_speed = 0;
		break;
	case PLAYER_ACTION.ATTACK:
		if(sprite_index != sprite_on.attack) {
			sprite_index = sprite_on.attack;
			image_index = 0;
		};
		
		horizontal_speed = 0;
		vertical_speed = 0;
		with_gravity = false;
		
		break;
	case PLAYER_ACTION.NONE:
		break;
	default:
		break;
};

if(vertical_speed == 0 && with_gravity = true && action != PLAYER_ACTION.ATTACK) {
	attacks_in_air = max_attacks_in_air;
};

var _door = instance_place(x, y, obj_door);
can_jump = !_door || _door.start;