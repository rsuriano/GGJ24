extends KinematicBody2D

export (int) var rock_speed = 400

var can_move = true
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("rock")
	pass # Replace with function body.

func get_input():
	velocity.x = 0
	
	var right = Input.is_action_pressed("p1_right")
	var left = Input.is_action_pressed("p1_left")

	if right:
		velocity.x += rock_speed
	if left:
		velocity.x -= rock_speed
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		get_input()
	
		if velocity.x != 0:
			$piedra/piedra_anims.play("pidra_move")
			
			if velocity.x < 0 and $piedra.scale.x > 0:
				$piedra.scale.x = -$piedra.scale.x
			
		if velocity.x > 0 and $piedra.scale.x < 0:
			$piedra.scale.x = -$piedra.scale.x
			
		else:
			$piedra/piedra_anims.stop()
	
		velocity = move_and_slide(velocity)
