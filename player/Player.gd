extends KinematicBody2D

const SPEED = 70

var moveDir = Vector2(0, 0)
var spriteDir = "down"

func _physics_process(delta):
    control_loop()
    move_loop()
    spritedir_loop()

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

func move_loop():
    var motion = moveDir.normalized() * SPEED
    move_and_slide(motion, Vector2(0, 0))

func spritedir_loop():
    match moveDir:
        Vector2(-1, 0):
            spriteDir = "Left"
        Vector2(1, 0):
            spriteDir = "Right"
        Vector2(0, -1):
            spriteDir = "Up"
        Vector2(0, 1):
            spriteDir = "Down"

func anim_switch(animation):
    var newAnim = str(animation, spriteDir)

    if $Anim.current_animation != newAnim:
        $Anim.play(newAnim);
