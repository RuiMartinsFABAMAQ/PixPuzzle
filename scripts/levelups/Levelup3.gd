extends CanvasLayer

onready var anim = $easyin
onready var extra_anim = $CanvasLayer/Node2D/AnimationPlayer

func _ready():
	anim.play("fade_out")
	extra_anim.play("position", false)


func _on_start_pressed():
	anim.play("fade_in")
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://scenes/levels/level4.tscn")
