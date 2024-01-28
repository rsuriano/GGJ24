extends Node2D


func _ready():
	$StartButton/Start_Boton/StartBoton_anim.playback_speed = 10
	$CreditsButton/credits_boton/creditsboton_anim.playback_speed = 10

# START BUTTON
func _on_Button_button_up():
	$StartButton/Start_Boton/StartBoton_anim.play("StartBoton_anim")

func _on_StartBoton_anim_animation_finished(anim_name):
	GlobalSceneManager.goto_scene("res://Scenes/MainGame.tscn")


# CREDITS BUTTON
func _on_CreditsButton_button_up():
	$CreditsButton/credits_boton/creditsboton_anim.play("CreditsBoton_anim")

func _on_creditsboton_anim_animation_finished(anim_name):
	GlobalSceneManager.goto_scene("res://Scenes/Credits.tscn")
