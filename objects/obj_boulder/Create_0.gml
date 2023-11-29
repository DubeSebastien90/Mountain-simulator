spd = random_range(1, 1.5)
rotSpd = random_range(1,3)
rotSpd *= choose(1,-1)
dir = random_range(-5,5)
image_index = choose(0,1,2,3)

function mortAnimation(){
	repeat(8){
		instance_create_depth(x,y,depth,obj_part_boulder)
	}
	screenShake(4,10)
	instance_destroy()
}	