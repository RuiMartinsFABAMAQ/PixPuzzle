extends Area2D

onready var selected = false
onready var anim = $AnimationPlayer
onready var currentPiece = $"../..".currentPiece

func _on_cell_mouse_entered():
	if Input.is_action_pressed("click"):
		selected = false
	else:
		selected = true
		z_index = 1
	if selected:
		anim.play("glow")

func _on_cell_mouse_exited():
	if selected == true:
		selected = false
		currentPiece = null
		anim.play_backwards("glow")
		z_index = 0

func _on_cell_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		currentPiece = self
	if selected and currentPiece == self:
		if Input.is_action_pressed("click"): 
			move_to_mouse()

func move_to_mouse():
	position = get_global_mouse_position()

func _ready():
	var mat = $glow.material.duplicate()
	var shader_mat = mat as ShaderMaterial
	shader_mat.set_shader_param("intensity", 0)
	$glow.material = mat
