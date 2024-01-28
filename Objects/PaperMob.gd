extends RigidBody2D

signal papermob_collision_with_rock

var rock_anim = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("paper_mobs")
	linear_velocity = Vector2(0, 150)
	$avion/avion_anim.play("avion7_anim")

func _on_PaperMob_body_entered(body):
	if body.is_in_group("rock"):
		
		body.can_move = false
		
		rock_anim = body.get_node("piedra").get_node("piedra_anims")
		rock_anim.play("piedra_muere")
		
		emit_signal("papermob_collision_with_rock")
		queue_free()
