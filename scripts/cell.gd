extends Area2D

onready var selected = false
onready var anim = $AnimationPlayer
onready var currentPiece = $"../..".currentPiece
onready var moving = false
onready var inZone = false

var rest_point
var rest_nodes = []
var cells = []
var drop = false

func _ready():
	var mat = $glow.material.duplicate()
	var shader_mat = mat as ShaderMaterial
	shader_mat.set_shader_param("intensity", 0)
	$glow.material = mat
	rest_nodes = get_tree().get_nodes_in_group("zone")
	cells = get_tree().get_nodes_in_group("cell")
	rest_point = rest_nodes[0].position
	rest_nodes[0].select()

func _on_cell_mouse_entered():
	if Input.is_action_pressed("click"):
		selected = false
	else:
		selected = true
		z_index = 1
	if selected:
		anim.play("glow")

func _on_cell_mouse_exited():
	if Input.is_action_pressed("click"):
		moving = true
	else:
		selected = false
		anim.play_backwards("glow")
		z_index = 0

func _on_cell_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		currentPiece = self
		$bt_click.play()
	if selected and currentPiece == self:
		if Input.is_action_pressed("click"): 
			moving = true
	if Input.is_action_just_released("click"):
			drop = true
			currentPiece = null

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			moving = false

func empty_cells():
	var shortest_dist = 50
	for child in rest_nodes:
		var distance = position.distance_to(child.position)
		if distance < shortest_dist:
			child.select()
			rest_point = child.position
			

func _physics_process(delta):
	empty_cells()
	if moving == true and currentPiece == self:
		position = lerp(position, get_global_mouse_position(), 30 * delta)
	if drop == true and currentPiece == null:
		position = lerp(position, rest_point, 15 * delta)
