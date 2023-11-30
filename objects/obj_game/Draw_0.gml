if game_state == 1{
	draw_set_alpha(0.6)
	draw_set_color(c_black)
	draw_rectangle(0,obj_camera.y - 125,room_width,obj_camera.y-35,false)
	draw_set_alpha(1)
	draw_set_font(fnt_pixel)
	draw_set_color(colorText)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text_transformed(obj_camera.x,obj_camera.y - 100,death_msg,2,2,0)
	draw_set_color(c_white)
	if nb_players = 1{
		draw_text_transformed(obj_camera.x,obj_camera.y - 75,"Your score :" + string(scoreFinal),1,1,0)
	}
	draw_text_transformed(obj_camera.x,obj_camera.y - 50,"Press space to restart",1,1,0)
}

if nb_players == 1 && game_state != 2{
	draw_set_font(fnt_pixel)
	draw_set_color(c_black)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_text_transformed(obj_camera.x - (room_width/2)*obj_camera.zoom_ammount + 2,obj_camera.y - (room_height/2)*obj_camera.zoom_ammount,"Score :" + string(_score),0.7,0.7,0)
}

if game_state == 2{
	draw_set_alpha(0.6)
	draw_set_color(c_black)
	draw_rectangle(0,obj_camera.y - 75,room_width,obj_camera.y+15,false)
	draw_set_alpha(1)
	draw_set_font(fnt_pixel)
	draw_set_color(c_white)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text_transformed(obj_camera.x,obj_camera.y - 60,"Select the number of players",0.9,0.9,0)
	draw_text_transformed(obj_camera.x,obj_camera.y - 30,"<  " + string(nb_players) + "  >",0.9,0.9,0)
	draw_text_transformed(obj_camera.x,obj_camera.y,"Press space to start",0.9,0.9,0)
}