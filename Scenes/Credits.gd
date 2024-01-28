extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$back_boton/backboton_anim.playback_speed = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_up():
	$back_boton/backboton_anim.play("backboton_anim")

func _on_backboton_anim_animation_finished(anim_name):
	GlobalSceneManager.goto_scene("res://Scenes/MainScreen.tscn")
