extends Node2D

signal scissors_cut_paper

var closing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$bottom_blade/tijera_bot/bot_anim.playback_speed = 2
	$top_blade/tijera_top/top_anim.playback_speed = 2

func close_sci():
	$bottom_blade/tijera_bot/bot_anim.play("bot_anim")
	$top_blade/tijera_top/top_anim.play("top_anim")

func get_input():
	var close = Input.is_action_just_pressed(GlobalSceneManager.keys_data["boss"]["action"]) 

	if (close and not closing):
		closing = true
		$"../Graphics".close_sci()

func _physics_process(_delta):
	if not GlobalSceneManager.inputs_locked:
		get_input()

func _on_bot_anim_animation_finished(anim_name):
	closing = false

func _on_bottom_blade_body_entered(body):
	if body.name == 'Paper':
		emit_signal("scissors_cut_paper")
