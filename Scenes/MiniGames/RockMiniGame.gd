extends Node2D

var spaceship_lives = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spaceship_lives = $ScissorSpaceship.lives

	if spaceship_lives == 2 and $ScissorLives/Heart3:
		$ScissorLives/Heart3.queue_free()
		# TODO: play sound
		
	if spaceship_lives == 1 and $ScissorLives/Heart2:
		$ScissorLives/Heart2.queue_free()
		# TODO: play sound
	
	if spaceship_lives == 0 and $ScissorLives/Heart:
		$ScissorLives/Heart.queue_free()
		# TODO: play sound

func _on_up_body_entered(body):
	if body.name != "Dome":
		body.queue_free()
