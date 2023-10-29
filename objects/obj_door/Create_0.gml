initial_image_speed = image_speed;

if(start) {
	state = DOOR_STATE.CLOSED;
	ajust_resolution(1280, 720, 2);
	viewport_enable();
	camera_set_view_pos(view_camera[0], x, y);
	layer_sequence_create("Transition", x, y - 14, seq_out);
	alarm[0] = in_time(3);
} else {
	state = DOOR_STATE.LOCKED;
};

function unlock() {
	state = DOOR_STATE.UNLOCKING;
};