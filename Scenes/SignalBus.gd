extends Node

signal game_completed()

func emit_game_completed():
	emit_signal("game_completed")
