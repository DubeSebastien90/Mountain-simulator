if game_state == 1{
	draw_set_font(fnt_pixel)
	draw_set_color(colorText)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text_transformed(room_width/2,obj_camera.y - 100,death_msg,2,2,0)
	draw_set_color(c_black)
	draw_text_transformed(room_width/2,obj_camera.y - 50,"Press space to restart",1,1,0)
}