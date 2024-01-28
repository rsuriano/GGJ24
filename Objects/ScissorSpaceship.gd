extends KinematicBody2D

export (int) var speed = 400
export (float) var rotation_speed = 5

export (int) var lives = 3

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('p1_right'):
		rotation_dir += 1
	if Input.is_action_pressed('p1_left'):
		rotation_dir -= 1
	
	velocity = Vector2(0, -speed).rotated(rotation)
	
	#if Input.is_action_pressed('p1_up'):
	#	velocity = Vector2(0, -speed).rotated(rotation)

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	move_and_slide(velocity)

func _process(delta):
	if lives <= 0:
		print("THE ROCK EMPIRE WON")

func _on_Area2D_body_entered(body):
	if body.get_parent().name == "Meteors":
		body.queue_free()
		lives -= 1
