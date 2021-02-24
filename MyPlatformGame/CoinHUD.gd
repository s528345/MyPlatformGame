extends CanvasLayer

var coins = 0

func _ready():
	$Coins.text = String(coins)

func _physics_process(_delta):
	if coins == 5:
		#get_tree().change_scene("res://Level1.tscn")
		pass
func _on_coin_collected():
	coins = coins + 1
	_ready()
