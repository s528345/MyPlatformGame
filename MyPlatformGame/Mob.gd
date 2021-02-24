extends KinematicBody2D

var velocity = Vector2()
export var direction = -1
var speed = 75

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	

func _physics_process(delta):
	
	if is_on_wall() or  not $FloorCheck.is_colliding():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		
		#Put ray check to front of mob for floor checking
		$FloorCheck.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += speed
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
