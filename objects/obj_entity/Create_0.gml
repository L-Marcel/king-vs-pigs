horizontal_speed = 0;
vertical_speed = 0;
sprite_on = scr_set_entity_sprites(name);
dead = false;
default_jump_button = vk_space;

/// @param {Bool} _can_jump
/// @param {Constant.VirtualKey} _key
/// @param {Bool} _force_jump
/// @param {Asset.GMSSprite} _sprite_index
/// @param {Real} _jump_force
function try_jump(
	_can_jump,
	_key = default_jump_button, 
	_force_jump = false, 
	_sprite_index = sprite_index,
	_jump_force = jump_force
) {
	var _trying_jump = name == "player" && keyboard_check_pressed(_key);
	
	if((_trying_jump && _can_jump) || _force_jump) {
		_sprite_index = sprite_on.jump;
		vertical_speed = -_jump_force;
	};
};