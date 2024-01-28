extends KinematicBody2D

export (int) var jump_speed = -1200
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false
var double_jump = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func get_input():
	var jump = Input.is_action_just_pressed("p2_up")

	if (jump and is_on_floor()):
		velocity.y = jump_speed
		jumping = true

	if (jump and is_on_floor() or jump and double_jump):
		velocity.y = jump_speed/2
		double_jump = false

func _physics_process(delta):
	get_input()
	
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
		double_jump = true
		
	velocity = move_and_slide(velocity, Vector2(0, -1))
		
