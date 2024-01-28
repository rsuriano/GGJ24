extends Node2D

var spaceship_lives = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	spaceship_lives = $ScissorSpaceship.lives

	if spaceship_lives == 2 and $ScissorLives.get_child_count() > 2:
		$ScissorLives/Heart3.queue_free()
		# TODO: play sound
		
	if spaceship_lives == 1 and $ScissorLives.get_child_count() > 1:
		$ScissorLives/Heart2.queue_free()
		# TODO: play sound
	
	if spaceship_lives == 0 and $ScissorLives.get_child_count() > 0:
		$ScissorLives/Heart.queue_free()
		# TODO: play sound

func _on_up_body_entered(body):
	if body.name != "Dome":
		body.queue_free()

func _on_GameoverTimer_timeout():
	get_tree().change_scene("res://Scenes/MainGame.tscn")
	pass # Replace with function body.
