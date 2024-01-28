extends Node

func game_over():
	print("game_over")
	$Countdown/Timer.stop()
	$GameoverTimer.start()
	
func new_game():
	$Countdown/Timer.start()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func _on_Countdown_Timer_timeout():
	pass
#	game_over()


func _on_GameoverTimer_timeout():
	get_tree().change_scene("res://Scenes/MainGame.tscn")
	pass # Replace with function body.
