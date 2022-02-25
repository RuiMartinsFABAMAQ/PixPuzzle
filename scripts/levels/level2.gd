extends Node2D

onready var anim = $easyin

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()

func _ready():
	anim.play("fade_out")
	var timeout = get_tree().get_root().find_node("Time_bar",true,false)
	timeout.connect("game_over",self,"game_over_func")
	var level_up = get_tree().get_root().find_node("cell2",true,false)
	level_up.connect("level_up2",self,"level2")
	
func game_over_func():
	anim.play("fade_in")
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://scenes/gameover_scene.tscn")

func level2():
	anim.play("fade_in")
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://scenes/level_ups/Levelup2.tscn")
