function start_game(){
	with(instance_create_layer(room_width/2-30,room_height/2,"player",obj_player)){
		_id = 0
		_color = 0
		controls = [vk_up, vk_left, vk_down, vk_right, vk_shift]
	}
	with(instance_create_layer(room_width/2+30,room_height/2,"player",obj_player)){
		_id = 1
		_color = 1
		controls = [ord("W"), ord("A"), ord("S"), ord("D"), ord("E")]
	}
}

function mort(_id){
	if game_state == 0{
		game_state = 1
		if _id = 0{
			death_msg = "Player 2 wins"
			colorText = c_orange
		}
		if _id = 1{
			death_msg = "Player 1 wins"
			colorText = c_blue
		}
	}
}

game_state = 0
death_msg = ""
colorText = noone

start_game()

randomize()
borne = 200
boulderCooldown = random_range(200,300)