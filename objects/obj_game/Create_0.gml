function start_game(nbPlayers){
	for(var i = 0; i < nbPlayers; i++){
		arrayMort[i] = false
	}
	if nbPlayers > 0{
	var xPos = 0
	if nbPlayers > 1
		xPos = 30
	with(instance_create_layer(room_width/2-xPos,room_height/2,"player",obj_player)){
		_id = 0
		_color = 0
		controls = [ord("W"), ord("A"), ord("S"), ord("D"), ord("E")]
	}
	}
	if nbPlayers > 1{
	with(instance_create_layer(room_width/2+30,room_height/2,"player",obj_player)){
		_id = 1
		_color = 1
		controls = [vk_up, vk_left, vk_down, vk_right, vk_shift]
	}
	}
	if nbPlayers > 2{
	with(instance_create_layer(room_width/2,room_height/2 - 30,"player",obj_player)){
		_id = 2
		_color = 2
		controls = [ord("U"), ord("H"), ord("J"), ord("K"), ord("I")]
	}
	}
}

function mort(_idDead){
	if game_state = 0{
	if nb_players > 1{
	if arrayMort[_idDead] = false{
		nb_alive_players -= 1
		arrayMort[_idDead] = true
		if nb_alive_players < 2{
			var _idWin = 0
			for(var i = 0 ; i< nb_players; i++){
				if arrayMort[i] = false
					_idWin = i
			}
			arrayColors = [c_blue, c_orange, c_green]
			game_state = 1
			colorText = arrayColors[_idWin]
			death_msg = "Player " + string(_idWin + 1) + " wins"
		}
	}
	} else{
		colorText = c_black
		death_msg = "Game over"
		game_state = 1
	}
	}
}

game_state = 0
death_msg = ""
colorText = noone

nb_players = 2
nb_alive_players = nb_players
start_game(nb_players)

randomize()
borne = 200
boulderCooldown = random_range(200,300)
powerUpCooldown = random_range(600,800)