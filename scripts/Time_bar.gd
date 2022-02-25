extends Node2D

signal game_over;

func _ready():
	var time_out = get_tree().get_root().find_node("TimeBar", true, false)
	time_out.connect("time_out", self, "_time_out")
	
func _time_out():
	emit_signal("game_over")
