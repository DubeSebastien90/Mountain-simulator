//utils
if keyboard_check_pressed(vk_tab){
	window_set_fullscreen(!window_get_fullscreen())
}

//boulders
if game_state != 2{
	boulderCooldown -= 1
}
if boulderCooldown < 0{
	instance_create_layer(random_range(borne+5,room_width-borne-5),obj_camera.y - room_height/2 - 30,"boulders", obj_boulder)
	boulderCooldown = random_range(200,300)
}

//powerUps
if game_state != 2{
	powerUpCooldown -= 1
}
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

//startGame
if game_state == 2{
	if keyboard_check_pressed(vk_space){
		_start_game(nb_players)
	}
	if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))  or keyboard_check_pressed(ord("H")){
		nb_players -= 1
		if nb_players < 1{
			nb_players = maxPlayers
		}
	}
	if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))  or keyboard_check_pressed(ord("K")){
		nb_players += 1
		if nb_players > maxPlayers{
			nb_players = 1
		}
	}
}

if game_state != 2{
	if borne < room_width/2 - 10{
		borne += 0.018
	} else borne = room_width/2 - 10
}