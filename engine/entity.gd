extends KinematicBody2D

const SPEED = 0

var moveDir = Vector2(0, 0)
var spriteDir = "Down"

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
