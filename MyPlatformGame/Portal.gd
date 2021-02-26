extends Area2D


var coins = 0 


func _ready():
	coins = 0
	$Sprite.hide()
	# Turn off collision
	set_collision_layer_bit(4,false)
	# Turn off player collision
	set_collision_mask_bit(0,false)

func _physics_process(_delta):
	if coins == 5:
		$Sprite.show()
		$AnimationPlayer.play("open")
		# Turn off collision
		set_collision_layer_bit(4,true)
		# Turn off player collision
		set_collision_mask_bit(0,true)

func _on_coin_collected():
	coins = coins + 1
