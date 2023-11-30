//ciel
draw_sprite_ext(spr_background,0,0,1000,room_width,1000000,0,c_white,1)
draw_sprite(spr_trees,0,(obj_camera.x - room_width/2)/3,room_height)

//nuage
for(var i = 0; i < 200; i++){
	draw_sprite_ext(spr_cloud,cloudIndex[i],room_width/2 + (cloudX[i]*(1-((obj_camera.x - room_width/2)/1000))),cloudY[i],cloudSize[i],cloudSize[i],0,c_white,0.9)
}

//montagne
draw_sprite_ext(spr_mountain,0,obj_game.borne,1000,room_width - 2*obj_game.borne,1000000,0,c_white,1)

//côté montage
for(var i = 0; i < 100; i++){
	draw_sprite_ext(spr_mountain_side,mountainSideL[i],obj_game.borne,room_height - i*40,-1,1,0,c_white,1)
	draw_sprite_ext(spr_mountain_side,mountainSideR[i],room_width - obj_game.borne,room_height - i*40,1,1,0,c_white,1)
}