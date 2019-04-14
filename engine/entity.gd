extends KinematicBody2D

const TYPE = "ENEMY"
const SPEED = 0

var moveDir = Vector2(0, 0)
var spriteDir = "Down"

var health = 1
var hitStun = 0
var knockDir = Vector2(0, 0)

func move_loop():
    var motion
    if hitStun == 0:
        motion = moveDir.normalized() * SPEED
    else:
        motion = knockDir.normalized() * SPEED * 1.5

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

func damage_loop():
    if hitStun > 0:
        hitStun -=1

    for body in $Hitbox.get_overlapping_bodies():
        if hitStun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
            health -= body.get("DAMAGE")
            hitStun = 10
            knockDir = transform.origin - body.transform.origin
