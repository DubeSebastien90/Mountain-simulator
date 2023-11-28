speed -= 0.018
if speed < 0.5{
	image_alpha = lerp(image_alpha,0,0.1)
	if image_alpha < 0.1{
		instance_destroy()
	}
}
image_angle += rotSpd