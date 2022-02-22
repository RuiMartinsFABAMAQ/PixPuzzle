extends CanvasLayer

func _ready():
	$easyin2.play("fade_out")
	pass

func _on_exit_pressed():
	get_tree().quit()

func _on_restart_pressed():
	$easyin2.play("fade_in")
	yield(get_tree().create_timer(1.2), "timeout")
	get_tree().change_scene("res://scenes/level1.tscn")
