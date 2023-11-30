spd = random_range(1.2, 1.4)
if obj_game.tempsScale > 30{
	spd += (obj_game.tempsScale - 30)/10
}
rotSpd = random_range(1,3)
rotSpd *= choose(1,-1)
dir = random_range(-5,5)
image_index = choose(0,1,2,3)

function mortAnimation(){
	repeat(8){
		instance_create_depth(x,y,depth,obj_part_boulder)
	}
	screenShake(4,10)
	obj_son.play_sound(snd_boulderCrash,0.1)
	instance_destroy()
}	