draw_self()
draw_sprite_ext(spr_player_hands,color,handX[0],handY[0],1,1,point_direction(x,y+10,handX[0],handY[0])-90,c_white,1)
draw_sprite_ext(spr_player_hands,color,handX[1],handY[1],-1,1,point_direction(x,y+10,handX[1],handY[1])-90,c_white,1)

//indicateur

temps += 0.05
indicRot = temps*10
indicSize = sin(temps)*0.1 + 1 
draw_sprite_ext(spr_cible,color,handX[hand_selected], handY[hand_selected], indicSize, indicSize, indicRot, c_white,0.6)