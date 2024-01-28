extends Node

signal countdown_over

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$Label.text="%02d" %$Timer.time_left


func _on_Timer_timeout():
	emit_signal("countdown_over")
