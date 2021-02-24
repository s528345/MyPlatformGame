extends Area2D




func _on_Coin_body_entered(body):
	$AnimationPlayer.play("bounce")
	body.addCoin()


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
