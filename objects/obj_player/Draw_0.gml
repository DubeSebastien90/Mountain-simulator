draw_self()
draw_sprite_ext(spr_player_hands,_color,handX[0],handY[0],handScale[0],handScale[0],point_direction(x,y+10,handX[0],handY[0])-90,c_white,1)
draw_sprite_ext(spr_player_hands,_color,handX[1],handY[1],-1*handScale[1],handScale[1],point_direction(x,y+10,handX[1],handY[1])-90,c_white,1)
if etourdi{
	draw_sprite_ext(spr_stars,0,x,y,1,1,0,c_white,1)
}

//indicateur
if control{
	temps += 0.05
	indicRot = temps*10
	indicSize = sin(temps)*0.1 + 1 
	draw_sprite_ext(spr_cible,_color,handX[hand_selected], handY[hand_selected], indicSize, indicSize, indicRot, c_white,0.6)
}
