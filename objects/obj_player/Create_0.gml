_color = 0
hand_selected = 0
nbHands = 2
longueurBrasMax = 30
longueurBras = 0
dirBras = 0

handX[0] = x - 18
handY[0] = y
handX[1] = x + 18
handY[1] = y
handScale[0] = 1
handScale[1] = 1

XDir = x
YDir = y

hspd = 0
vspd = 0
walkspd = 0.8

indicRot = 0
indicSize = 1
temps = 0
control = true
etourdi = false
dead = false
knockoutCooldown = 30

grav = 0.03
vspdGrav = 0

function mortAnimation(){
	control = false
	dead = true
}
