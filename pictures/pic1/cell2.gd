extends KinematicBody2D

var selected = false

func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		selected = true

func _process(delta):
	print (selected)
	if selected:
		move_to_mouse()

func move_to_mouse():
	position = get_global_mouse_position()




