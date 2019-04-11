extends KinematicBody2D

const SPEED = 70

var moveDir = Vector2(0, 0)

func _physics_process(delta):
    control_loop()
    move_loop()

func control_loop():
    var left = Input.is_action_pressed("ui_left")
    var right = Input.is_action_pressed("ui_right")
    var up = Input.is_action_pressed("ui_up")
    var down = Input.is_action_pressed("ui_down")

    moveDir.x = -int(left) + int(right);
    moveDir.y = int(down) - int(up);

func move_loop():
    var motion = moveDir.normalized() * SPEED
    move_and_slide(motion, Vector2(0, 0))
