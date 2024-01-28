extends Node

var current_scene = null
var inputs_locked = false

var players_data = {
	"player_1": {
		"figure": null, 
		"is_boss": false,
		"badges": []
	},
	"player_2": {
		"figure": null,
		"is_boss": false,
		"badges": []
	}
}

var keys_data = {
	"boss": {
		"up": "p1_up",
		"down": "p1_down",
		"left": "p1_left",
		"right": "p1_right",
		"action": "p1_action"
	},
	"mob": {
		"up": "p2_up",
		"down": "p2_down",
		"left": "p2_left",
		"right": "p2_right",
		"action": "p2_action"
	}
}

func boss_p1_mob_p2():
	keys_data = {
		"boss": {
			"up": "p1_up",
			"down": "p1_down",
			"left": "p1_left",
			"right": "p1_right",
			"action": "p1_action"
		},
		"mob": {
			"up": "p2_up",
			"down": "p2_down",
			"left": "p2_left",
			"right": "p2_right",
			"action": "p2_action"
		}
	}
	
func mob_p1_boss_p2():
	keys_data = {
		"boss": {
			"up": "p2_up",
			"down": "p2_down",
			"left": "p2_left",
			"right": "p2_right",
			"action": "p2_action"
		},
		"mob": {
			"up": "p1_up",
			"down": "p1_down",
			"left": "p1_left",
			"right": "p1_right",
			"action": "p1_action"
		}
	}

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)
	
func _deferred_goto_scene(path):
	current_scene.free()
	
	var s = ResourceLoader.load(path)
	
	current_scene = s.instance()
	
	get_tree().root.add_child(current_scene)
	
	get_tree().current_scene = current_scene
	
	current_scene.connect("game_over", self, "_on_game_over")

func _on_game_over(winner): # boss mob
	inputs_locked = false
	if(winner == "boss" and players_data["player_1"]["is_boss"] or winner == "mob" and not players_data["player_1"]["is_boss"]):
		goto_scene("res://Scenes/MiniGameOutcome/P1Win.tscn")
	else:
		goto_scene("res://Scenes/MiniGameOutcome/P2Win.tscn")
	
func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
#	print(current_scene)
