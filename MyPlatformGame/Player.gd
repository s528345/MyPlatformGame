extends KinematicBody2D

var velocity = Vector2.ZERO 
const SPEED = 180
const JUMPFORCE = -750
const GRAVITY = 30
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite.animation = 'idle'
	
func _physics_process(delta):
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.animation = 'walk'
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.animation = 'walk'
		
	velocity.y = velocity.y + GRAVITY

	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMPFORCE
	velocity = move_and_slide(velocity)

	velocity.x = lerp(velocity.x,0,0.2)
