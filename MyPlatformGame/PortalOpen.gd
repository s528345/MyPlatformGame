extends Area2D

signal won

func _on_PortalOpen_body_entered(body):
	emit_signal("won")
