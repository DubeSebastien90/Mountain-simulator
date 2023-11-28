//contorls
press_up = keyboard_check(controls[0])
press_left = keyboard_check(controls[1])
press_down = keyboard_check(controls[2])
press_right = keyboard_check(controls[3])
press_next = keyboard_check_pressed(controls[4])

//mouvement
var moveX = press_right - press_left
var moveY = press_down - press_up

if control{
	hspd = walkspd*moveX
	vspd = walkspd*moveY
} else {
	hspd = 0
	vspd = 0
}

longueurBras = sqrt(power(((handX[hand_selected]+hspd)-x), 2) + power(((handY[hand_selected]+vspd)-y), 2))
dirBras = point_direction(x, y, (handX[hand_selected]+hspd), ((handY[hand_selected]+vspd)))

if longueurBras <= longueurBrasMax{
handX[hand_selected] += hspd
handY[hand_selected] += vspd
} else{
	handX[hand_selected] = x + dcos(dirBras)*longueurBrasMax
	handY[hand_selected] = y - dsin(dirBras)*longueurBrasMax
}

//côtées de la montage
if handX[hand_selected] < obj_game.borne{
	handX[hand_selected] = obj_game.borne
}
if handX[hand_selected] > room_width - obj_game.borne{
	handX[hand_selected] = room_width - obj_game.borne
}

if press_next{
	hand_selected += 1
	hand_selected = hand_selected%2
	XDir = (handX[0] + handX[1])/2
	YDir = (handY[0] + handY[1])/2
}

dist = distance_to_point(XDir, YDir)
_hspd = dcos(point_direction(x, y, XDir, YDir)) * dist/10
_vspd = -dsin(point_direction(x, y, XDir, YDir)) * dist/10
if place_meeting(x+_hspd, y, obj_player){
	while!(place_meeting(x+sign(_hspd), y, obj_player)){
		x += sign(_hspd)
	}
	_hspd = 0
}
if place_meeting(x, y+_vspd, obj_player){
	while!(place_meeting(x,y+sign(_vspd), obj_player)){
		y += sign(_vspd)
	}
	_vspd = 0
}

x += _hspd
y += _vspd

//mort
if y > obj_camera.y + (room_height/2)*0.7{
	obj_game.mort(_id)
}

//animation
image_index = color
