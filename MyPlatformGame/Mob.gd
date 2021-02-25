extends KinematicBody2D

var velocity = Vector2()
export var detect_cliff = true
export var direction = -1
var SPEED = 75
var GRAVITY = 100

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	#Put ray check to front of mob for floor checking
	$FloorCheck.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$FloorCheck.enabled = detect_cliff
	

func _physics_process(delta):
	
	if is_on_wall() or  not $FloorCheck.is_colliding() and detect_cliff and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		
		#Put ray check to front of mob for floor checking
		$FloorCheck.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += GRAVITY
	
	velocity.x = SPEED * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_TopChecker_body_entered(body):
	$AnimatedSprite.play("dead")
	SPEED = 0
	# Turn off collision
	set_collision_layer_bit(4,false)
	# Turn off player collision
	set_collision_mask_bit(0,false)
	#Turn off top checker collisions 
	$TopChecker.set_collision_layer_bit(4,false)
	$TopChecker.set_collision_mask_bit(0,false)
	#Turn off sides checker collisions 
	$SidesChecker.set_collision_layer_bit(4,false)
	$SidesChecker.set_collision_mask_bit(0,false)
	
	$Timer.start()
	
	body.bounce()


func _on_SidesChecker_body_entered(body):
	print("Enemy hit player, Ouch")
	body.damage(position.x)


func _on_Timer_timeout():
	queue_free()
