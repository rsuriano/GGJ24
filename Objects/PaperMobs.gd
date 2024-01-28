extends Node

export(PackedScene) var papermob_scene

signal papermobs_collision_with_rock

var cooldown = false

func spawn_paper():
	var paper_boss_position = $"../PaperBoss".position
	
	var papermob = papermob_scene.instance()	
	papermob.position = paper_boss_position
	add_child(papermob)
	papermob.connect("papermob_collision_with_rock", self, "_on_papermob_collision_with_rock")

func _on_papermob_collision_with_rock():
	emit_signal("papermobs_collision_with_rock")
	
func get_input():
	var spawn = Input.is_action_just_pressed(GlobalSceneManager.keys_data["boss"]["action"])
	
	if spawn:
		var spawned_papermobs = get_children().size()
		if not cooldown:
			spawn_paper()
			$SpawnCooldownTimer.start()
			cooldown = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()

func _on_Floor_body_entered(body):
	if body.is_in_group("paper_mobs"):
		remove_child(body)

func _on_SpawnCooldownTimer_timeout():
	cooldown = false
