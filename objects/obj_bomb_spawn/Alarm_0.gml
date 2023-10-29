var _bomb = instance_create_layer(x, y + 10, layer, obj_bomb);
_bomb.created_by = id;
_bomb.need_layer_changed = true;

bomb_destroyed = false;