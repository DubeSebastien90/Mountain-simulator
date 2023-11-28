//utils
if keyboard_check_pressed(vk_tab){
	window_set_fullscreen(!window_get_fullscreen())
}

//boulders
boulderCooldown -= 1
if boulderCooldown < 0{
	instance_create_layer(random_range(borne+20,room_width-borne-20),obj_camera.y - room_height/2 - 30,"boulders", obj_boulder)
	boulderCooldown = random_range(200,300)
}

//mort