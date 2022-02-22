extends Node2D

var currentPiece = null
var game_over = false

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()

func _ready():
	$easyin.play("fade_out")
	var timeout = get_tree().get_root().find_node("Time_bar", true, false)
	timeout.connect("game_over",self, "game_over")
	
func game_over():
	$easyin.play("fade_in")
	yield(get_tree().create_timer(0.7), "timeout")
	get_tree().change_scene("res://scenes/gameover_scene.tscn")
