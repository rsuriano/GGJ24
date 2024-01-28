extends Node2D

signal game_over

var spaceship_lives = 0

func new_game():
	$Countdown/Timer.start()
	$ScissorSpaceship.connect("spaceship_destroyed", self, "_on_spaceship_destroyed")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func game_over():
	GlobalSceneManager.inputs_locked = true
	$Countdown/Timer.stop()
	$GameoverTimer.start()
	
func _on_spaceship_destroyed():
	game_over()

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
	emit_signal("game_over")
