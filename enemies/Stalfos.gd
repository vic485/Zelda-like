extends "res://engine/entity.gd"

const SPEED = 40
const DAMAGE = 1

var moveTimer_length = 15
var moveTimer = 0

func _ready():
	$Anim.play("Default")
	moveDir = dir.rand()

func _physics_process(delta):
	move_loop()
	damage_loop()

	if moveTimer > 0:
		moveTimer -= 1

	if moveTimer == 0 || is_on_wall():
		moveDir = dir.rand()
		moveTimer = moveTimer_length
