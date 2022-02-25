extends CanvasLayer

onready var anim = $easyin3

func _ready():
	anim.play("fade_out_gameover")

func _on_finish_pressed():
	get_tree().quit()
