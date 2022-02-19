extends Node2D

var currentPiece = null

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()

