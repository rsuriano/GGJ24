extends Node2D

func _ready():
	pass # Replace with function body.


func _process(delta):
	if (Input.is_action_just_pressed(GlobalSceneManager.keys_data["boss"]["action"]) or Input.is_action_just_pressed(GlobalSceneManager.keys_data["mob"]["action"])):
		GlobalSceneManager.goto_scene("res://Scenes/MiniGames/ScissorsMiniGame.tscn")
