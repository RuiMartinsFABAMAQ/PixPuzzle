extends CanvasLayer

onready var anim = $easyin3

func _on_start_pressed():
	anim.play("fade_in")
	$AudioStreamPlayer.play()
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://scenes/levels/level1.tscn")

