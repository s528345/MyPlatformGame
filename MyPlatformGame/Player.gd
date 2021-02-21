extends KinematicBody2D

var velocity = Vector2.ZERO 
const SPEED = 300
const JUMPFORCE = -950
const GRAVITY = 30
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	$Sprite.play('idle')
	
func _physics_process(_delta):
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else: 
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("jump")
		
	velocity.y = velocity.y + GRAVITY

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		$Sprite.play("jump")
	
	velocity = move_and_slide(velocity, Vector2.UP)

	velocity.x = lerp(velocity.x,0,0.2)
