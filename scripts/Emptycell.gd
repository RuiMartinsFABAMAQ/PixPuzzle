extends Position2D

func _draw():
	draw_rect(Rect2(Vector2(-50, -50), Vector2(100, 100)), Color.white)

func select():
	modulate = Color.red
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()

func deselect():
	modulate = Color.white
