extends KinematicBody2D

signal spaceship_destroyed

export (int) var speed = 200
export (float) var rotation_speed = 3.0

export (int) var lives = 3

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed(GlobalSceneManager.keys_data["mob"]["right"]):
		rotation_dir += 1
	if Input.is_action_pressed(GlobalSceneManager.keys_data["mob"]["left"]):
		rotation_dir -= 1
	
	velocity = Vector2(0, -speed).rotated(rotation)
	
	#if Input.is_action_pressed('p1_up'):
	#	velocity = Vector2(0, -speed).rotated(rotation)

func _physics_process(delta):
	if not GlobalSceneManager.inputs_locked:
		get_input()
	
	if $Nave.visible:
		rotation += rotation_dir * rotation_speed * delta
		move_and_slide(velocity)

func _process(_delta):
	if lives <= 0:
		
		if $Nave.visible:
			
			$".".velocity = Vector2.ZERO
			$Nave.visible = false
			
			$Explosion.visible = true
			$Explosion.init()
			

func _on_Area2D_body_entered(body):
	if body.get_parent().name == "Meteors":
		body.queue_free()
		lives -= 1


func _on_explosion_anim_animation_finished(anim_name):
	emit_signal("spaceship_destroyed")
