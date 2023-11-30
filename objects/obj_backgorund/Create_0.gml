for(var i = 0; i < 100; i++){
	mountainSideL[i] = choose(0,1,2)
	mountainSideR[i] = choose(0,1,2)
}

yOffset = 0
for(var i = 0; i < 200; i++){
	cloudX[i] = random_range(-(room_width/2 - 50),room_width/2 - 50)
	cloudY[i] = room_height - 250 - yOffset
	cloudIndex[i] = choose(0,1,2,3)
	cloudSize[i] = random_range(2.9,3.1)
	yOffset += random_range(40,70)
}

yOffset = 0
for(var i = 0; i < 300; i++){
	tacheX[i] = random_range(-(((room_width-2*obj_game.borne)/2)-20),(room_width-2*obj_game.borne)/2-20)
	tacheY[i] = room_height - 10 - yOffset
	yOffset += random_range(12,20)*(1+(i/50))
}

