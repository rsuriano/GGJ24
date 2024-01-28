extends Node2D

func new_game():
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$PaperMobs.connect("papermobs_collision_with_rock", self, "_on_papermobs_collision_with_rock")
	new_game()

func game_over():
	print("game_over")

func _on_papermobs_collision_with_rock():
	game_over()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
