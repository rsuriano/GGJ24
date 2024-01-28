extends RigidBody2D

export (int) var speed = 200

var initial_angle = 0
var initial_position = Vector2(0, 0)

func _ready():
	linear_velocity = Vector2(0, -speed).rotated(initial_angle)
	position = initial_position
	set_bounce(1)

func init(parent_angle, parent_position):
	initial_angle = parent_angle
	initial_position = parent_position
