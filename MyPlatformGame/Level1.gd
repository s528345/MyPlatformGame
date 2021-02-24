extends Node2D

func _ready():
	$PortalOpen/AnimationPlayer.play("open")
	
func _on_Player_win():
	$PortalOpen/AnimationPlayer.show()
	$PortalOpen/AnimationPlayer.play("open")
	


func _on_PortalOpen_won():
	#get_tree().change_scene("res://Level1.tscn")
	pass
