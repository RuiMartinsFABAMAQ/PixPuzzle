extends Area2D

signal level_up2

onready var anim = $AnimationPlayer
onready var currentPiece = $"../..".currentPiece
export var group = "dragable"

var _touch_position = Vector2.ZERO
var _dragging = false
var levelUP = false
var drop_zone = []
var cells = []

func _ready() -> void:
	add_to_group(group)
	var mat = $glow.material.duplicate()
	var shader_mat = mat as ShaderMaterial
	shader_mat.set_shader_param("intensity", 0)
	$glow.material = mat
	drop_zone = get_tree().get_nodes_in_group("zone")
	cells = get_tree().get_nodes_in_group("cell")

func _is_on_top() -> bool:
	for dragable in get_tree().get_nodes_in_group(group + "hovered"):
		if dragable.get_index() > get_index():
			return false
	return true

func _on_cell_mouse_entered() -> void:
	if Input.is_action_pressed("click"):
		return
	else:
		add_to_group(group + "hovered")
		z_index = 1
		anim.play("glow")

func _on_cell_mouse_exited():
	if Input.is_action_pressed("click"):
		return
	else:
		remove_from_group(group + "hovered")
		anim.play_backwards("glow")
		z_index = 0

func _input(event) -> void:
	if not _dragging:
		return
	if event.is_action_released("click"):
		_dragging = false
		emptycell()
		
	if event is InputEventMouseMotion:
		position -= _touch_position - (event.position)
		_touch_position = event.position

func _on_cell_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		if _is_on_top():
			$bt_click.play()
			_dragging = true
			_touch_position = event.position

func emptycell():
	var shortest_dist = 50
	for child in drop_zone:
		var distance = position.distance_to(child.position)
		if distance < shortest_dist:
			position = child.position

func level_up_check():
	if cells[0].position == drop_zone[0].position:
		if cells[1].position == drop_zone[1].position:
			if cells[2].position == drop_zone[2].position:
				if cells[3].position == drop_zone[3].position:
					if cells[4].position == drop_zone[4].position:
						if cells[6].position == drop_zone[6].position:
							if cells[7].position == drop_zone[7].position:
								if cells[8].position == drop_zone[8].position:
									levelUP = true

func _process(delta):
	level_up_check()
	if levelUP == true:
		emit_signal("level_up2")
