extends CanvasLayer

func _on_start_pressed():
	$easyin3.play("fade_in")
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://scenes/level1.tscn")
