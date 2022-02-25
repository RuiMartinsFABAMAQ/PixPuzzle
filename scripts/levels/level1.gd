extends Node2D

onready var anim = $easyin

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()

func _ready():
	anim.play("fade_out")
	var timeout = get_tree().get_root().find_node("Time_bar",true,false)
	timeout.connect("game_over",self,"game_over_func")
	var level_up1 = get_tree().get_root().find_node("cell",true,false)
	level_up1.connect("level_up1",self,"level1")
	
func game_over_func():
	anim.play("fade_in")
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://scenes/gameover_scene.tscn")

func level1():
	anim.play("fade_in")
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://scenes/level_ups/Levelup1.tscn")
