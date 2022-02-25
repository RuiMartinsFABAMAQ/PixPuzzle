extends CanvasLayer

onready var anim = $easyin2

func _ready():
	anim.play("fade_out")
	pass

func _on_exit_pressed():
	get_tree().quit()

func _on_restart_pressed():
	anim.play("fade_in")
	yield(get_tree().create_timer(0.7), "timeout")
	get_tree().change_scene("res://scenes/level1.tscn")
