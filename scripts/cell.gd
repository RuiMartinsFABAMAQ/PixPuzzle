extends Area2D

onready var selected = false
onready var anim = $AnimationPlayer
onready var currentPiece = $"../..".currentPiece

var grid_size = 100

func _on_cell_mouse_entered():
	selected = true
	if selected:
		anim.play("glow")
	else:
		anim.play_backwards("glow")

func _on_cell_mouse_exited():
	selected = false
	anim.play_backwards("glow")

func _on_cell_input_event(viewport, event, shape_idx):
	if selected:
		if Input.is_action_pressed("click"): 
			move_to_mouse()

func move_to_mouse():
	position = get_global_mouse_position()

func _ready():
	var mat = $glow.material.duplicate()
	var shader_mat = mat as ShaderMaterial
	shader_mat.set_shader_param("intensity", 0)
	$glow.material = mat
