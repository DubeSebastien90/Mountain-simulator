//utils
if keyboard_check_pressed(vk_tab){
	window_set_fullscreen(!window_get_fullscreen())
}

//boulders
boulderCooldown -= 1
if boulderCooldown < 0{
	instance_create_layer(random_range(borne+5,room_width-borne-5),obj_camera.y - room_height/2 - 30,"boulders", obj_boulder)
	boulderCooldown = random_range(200,300)
}

//powerUps
powerUpCooldown -= 1
if powerUpCooldown < 0{
	with(instance_create_layer(random_range(borne+20,room_width-borne-20),obj_camera.y - room_height/2 - 30,"boulders", obj_boost)){
		_type = choose(0,1,2)
		depth -= 1
	}
	powerUpCooldown = random_range(600,800)
}

//mort
if game_state == 1 && keyboard_check_pressed(vk_space){
	game_restart()
}

borne += 0.018