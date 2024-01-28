extends Node2D

var closing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func close_sci():
	$bottom_blade/tijera_bot/bot_anim.play("bot_anim")
	$top_blade/tijera_top/top_anim.play("top_anim")

func get_input():
	
	var close = Input.is_action_just_pressed("p1_action")

	if (close and not closing):
		closing = true
		$"../Graphics".close_sci()

func _physics_process(_delta):
	get_input()


func _on_bot_anim_animation_finished(anim_name):
	closing = false


func _on_bottom_blade_body_entered(body):
	if body.name == 'Paper':
		body.get_parent().game_over()
