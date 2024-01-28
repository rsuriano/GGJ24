extends KinematicBody2D

export (int) var paper_speed = 500
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	velocity.x = 0
	
	var right = Input.is_action_pressed("p2_right")
	var left = Input.is_action_pressed("p2_left")

	if right:
		velocity.x += paper_speed
	if left:
		velocity.x -= paper_speed
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	
	velocity = move_and_slide(velocity)
