extends Node2D

signal game_over(winner)

var winner = ""

func new_game():
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$PaperMobs.connect("papermobs_collision_with_rock", self, "_on_papermobs_collision_with_rock")
	new_game()

func game_over():
	$GameoverTimer.start()

func _on_papermobs_collision_with_rock():
	winner = "boss"
	game_over()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_GameoverTimer_timeout():
	emit_signal("game_over", winner)

func _on_Countdown_countdown_over():
	winner = "mob"
	game_over()
