extends Line2D

signal time_out

func _ready():
	yield(get_tree().create_timer(3.0), "timeout")

func _decrease():
		points[1].x -= 40;

func no_more_time():
	return points[1].x <=  0.0;

func _on_Timer_timeout():
	if points[1].x > 0.0:
		_decrease()
		if no_more_time():
			emit_signal("time_out")
	else:
		return
