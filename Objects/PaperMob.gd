extends RigidBody2D

signal papermob_collision_with_rock

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("paper_mobs")

func _on_PaperMob_body_entered(body):
	if body.is_in_group("rock"):
		emit_signal("papermob_collision_with_rock")

