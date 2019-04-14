extends "res://engine/entity.gd"

const TYPE = "PLAYER"
const SPEED = 70

func _physics_process(delta):
    control_loop()
    move_loop()
    spritedir_loop()
    damage_loop()

    if is_on_wall():
        if spriteDir == "Left" and test_move(transform, Vector2(-1, 0)):
            anim_switch("Push")
        elif spriteDir == "Right" and test_move(transform, Vector2(1, 0)):
            anim_switch("Push")
        elif spriteDir == "Up" and test_move(transform, Vector2(0, -1)):
            anim_switch("Push")
        elif spriteDir == "Down" and test_move(transform, Vector2(0, 1)):
            anim_switch("Push")
    elif moveDir != Vector2(0, 0):
        anim_switch("Walk")
    else:
        anim_switch("Idle")

func control_loop():
    var left = Input.is_action_pressed("ui_left")
    var right = Input.is_action_pressed("ui_right")
    var up = Input.is_action_pressed("ui_up")
    var down = Input.is_action_pressed("ui_down")

    moveDir.x = -int(left) + int(right);
    moveDir.y = int(down) - int(up);
