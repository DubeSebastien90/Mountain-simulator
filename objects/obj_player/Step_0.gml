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
if handX[0] < obj_game.borne+5{
	handX[0] = obj_game.borne+5
}
if handX[0] > room_width - obj_game.borne - 5{
	handX[0] = room_width - obj_game.borne - 5
}
if handX[1] < obj_game.borne+5{
	handX[1] = obj_game.borne+5
}
if handX[1] > room_width - obj_game.borne-5{
	handX[1] = room_width - obj_game.borne-5
}

if press_next && control{
	var _index = 0
	var moi = self
	with(obj_player){
		if self != moi{
			if position_meeting(moi.handX[moi.hand_selected], moi.handY[moi.hand_selected], self){
				_index = _color + 2
				control = false
				etourdi = true
				alarm[0] = moi.knockoutCooldown
			}
		}
	}
	with(obj_boost){
		if position_meeting(moi.handX[moi.hand_selected], moi.handY[moi.hand_selected], self){
			if _type == 0{
				moi.longueurBrasMax += 5
			} else if _type == 1{
				moi.walkspd += 0.2
			} else{
				moi.knockoutCooldown += 5
			}
			_index = 1
			instance_destroy()
		}
	}
	with(obj_wazo_collision){
		if position_meeting(moi.handX[moi.hand_selected], moi.handY[moi.hand_selected], self){
			obj_game.addup += 5
			if obj_game.nb_players = 1{
			with(instance_create_depth(x,y,depth-1,obj_textShow)){
				text = "+5"
			}
			}
			myBird.mortAbility()
		}
	}
	repeat(8){
		with(instance_create_depth(handX[hand_selected], handY[hand_selected],depth - 3, obj_part_grab)){
			image_index = _index
		}
	}
	handScale[hand_selected] = 0.9
	hand_selected += 1
	hand_selected = hand_selected%2
	XDir = (handX[0] + handX[1])/2
	YDir = (handY[0] + handY[1])/2
	handScale[hand_selected] = 1.1
}

dist = distance_to_point(XDir, YDir)
_hspd = dcos(point_direction(x, y, XDir, YDir)) * dist/10
_vspd = -dsin(point_direction(x, y, XDir, YDir)) * dist/10

if etourdi{
	vspdGrav += grav
	_vspd += vspdGrav
} else {
	vspdGrav = 0
}

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

if place_meeting(x+_hspd, y+_vspd, obj_player){
	while!(place_meeting(x+sign(hspd),y+sign(_vspd), obj_player)){
		y += sign(_vspd)
		x += sign(_hspd)
	}
	_vspd = 0
	_hspd = 0
}

x += _hspd
y += _vspd
if etourdi{
	YDir = y
	handY[0] += _vspd
	handY[1] += _vspd
}

//mort
if y > obj_camera.y + (room_height/2)*0.7 && !dead{
	obj_game.mort(_id)
	mortAnimation()
}

//animation
image_index = _color
rot = (handY[0] - handY[1])
