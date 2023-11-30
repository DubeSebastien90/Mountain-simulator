if !dead{
	other.mortAbility()
	alarm[0] = 60
	control = false
	etourdi = true
	obj_game.addup -= 3
	if obj_game.nb_players = 1{
	with(instance_create_depth(x,y,depth-1,obj_textShow)){
		text = "-3"
	}
	}
}