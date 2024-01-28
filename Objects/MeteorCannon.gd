extends KinematicBody2D

export (int) var speed = 100
export (float) var rotation_speed = 1.5

const MAXANGLE = 55
const MAXMETEOR = 5

var velocity = Vector2()
var rotation_dir = 0

var can_rotate = true
var future_rotation = rotation

var meteor = load("res://Objects/Meteor.tscn")
var meteor_instance = meteor.instance()


func get_input():
	velocity = Vector2()
	rotation_dir = 0
	
	if Input.is_action_pressed(GlobalSceneManager.keys_data["boss"]["right"]):
		rotation_dir = 1
		
	if Input.is_action_pressed(GlobalSceneManager.keys_data["boss"]["left"]):
		rotation_dir = -1

func _input(_event):
	if Input.is_action_just_pressed(GlobalSceneManager.keys_data["boss"]["action"]):
		
		if $"../Meteors".get_child_count() < MAXMETEOR:
			$CannonSprite/canion_anim.stop()
			$CannonSprite/canion_anim.play("canion_anim")
			
			meteor_instance = meteor.instance()
			meteor_instance.init(rotation, $MeteorSpawner.position.rotated(rotation))
			$"../Meteors".add_child(meteor_instance)

func _physics_process(delta):
	if not GlobalSceneManager.inputs_locked:
		get_input()
		
	future_rotation = rotation + rotation_dir * rotation_speed * delta
	
	if future_rotation > deg2rad(MAXANGLE):
		rotation = deg2rad(MAXANGLE)
		
		if rotation_dir > 0:
			can_rotate = false

	if future_rotation < deg2rad(-MAXANGLE):
		rotation = deg2rad(-MAXANGLE)
		
		if rotation_dir < 0:
			can_rotate = false	

	if can_rotate:
		rotation += rotation_dir * rotation_speed * delta

	can_rotate = true
