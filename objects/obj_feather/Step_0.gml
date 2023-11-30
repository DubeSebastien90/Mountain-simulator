if grav = 0{
speed -= 0.05
}
if speed < 1{
	image_alpha = lerp(image_alpha,0,0.1)
	if image_alpha < 0.1{
		instance_destroy()
	}
}
image_angle += rotSpd

vspd += grav
y += vspd