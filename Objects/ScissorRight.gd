extends KinematicBody2D

var closing = false
var velocity = Vector2()
export (int) var close_speed = 2800

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	var close = Input.is_action_just_pressed("p1_action")

	if (close and not closing):
		closing = true
		$Timer.start()
		$"../Graphics".close_sci()
		velocity.x = close_speed
		
func _physics_process(delta):
	if is_on_wall() and closing:
		closing = false
	get_input()
		
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _on_Timer_timeout():
	velocity = -velocity
#	Player lose

func _on_Area2D_body_entered(body):
	if body.name == 'Paper':
		
		body.get_parent().game_over()
	pass # Replace with function body.
