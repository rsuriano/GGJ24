extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton/Start_Boton/StartBoton_anim.playback_speed = 10

func _on_Button_button_up():
	
	$StartButton/Start_Boton/StartBoton_anim.play("StartBoton_anim")

func _on_StartBoton_anim_animation_finished(anim_name):
	GlobalSceneManager.goto_scene("res://Scenes/MainGame.tscn")


func _on_CreditsButton_button_up():
	GlobalSceneManager.goto_scene("res://Scenes/Credits.tscn")
