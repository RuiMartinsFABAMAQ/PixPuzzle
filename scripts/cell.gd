extends Area2D

onready var selected = false
var grid_size = 100

func _on_cell_mouse_entered():
	selected = true
	if selected:
		$AnimationPlayer.play("glow")
	else:
		$AnimationPlayer.play_backwards("glow")

func _on_cell_mouse_exited():
	selected = false
	$AnimationPlayer.play_backwards("glow")

func _on_cell_input_event(viewport, event, shape_idx):
	if selected:
		if Input.is_action_pressed("click"): 
			move_to_mouse()

func move_to_mouse():
	position = get_global_mouse_position()
