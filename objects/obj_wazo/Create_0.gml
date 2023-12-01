side = sign(room_width/2 - x)

walkspd = 0.1
acc = 0.005

size = random_range(1.2,1.4)

var moi =self
with(instance_create_depth(x,y,depth,obj_wazo_collision)){
	myBird = moi
	moi.myCollision = self
	image_xscale = moi.size*moi.side
	image_yscale = moi.size
}

temps = 0
yStart = y
radius = random_range(10,15)
incr = random_range(0.08,0.12)

image_xscale = size*side
image_yscale = size

image_speed = 1.85

depth -= 3

function mortAbility(){
	screenShake(4,10)
	obj_son.play_sound_normal(snd_bird_dead)
	with(myCollision){
		instance_destroy()
	}
	with(instance_create_depth(x,y,depth,obj_feather)){
		image_index = 2
		depth -= 1
		direction = random_range(45,135)
		grav = 0.04
	}
	repeat(7){
		instance_create_depth(x,y,depth,obj_feather)
	}
	instance_destroy()
}