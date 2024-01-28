extends Node

signal game_over(winner)

var winner = ""

func game_over():
	GlobalSceneManager.inputs_locked = true
	$Countdown/Timer.stop()
	$GameoverTimer.start()
	
func new_game():
	$Countdown/Timer.start()
	$Graphics.connect("scissors_cut_paper", self, "_on_scissors_cut_paper")
	
func _on_scissors_cut_paper():
	$Paper/tipo/tipo_anims.stop()
	$Paper/tipo/tipo_anims.play("muere_anim")
	winner = "boss"
	game_over()

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func _on_GameoverTimer_timeout():
	emit_signal("game_over", winner)

func _on_Countdown_countdown_over():
	winner = "mob"
	game_over()
