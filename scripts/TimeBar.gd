extends Line2D

signal time_out;

func _decrease():
	points[1].x -= 10;

func no_more_time():
	return points[1].x ==  0;

func _on_Timer_timeout():
	if no_more_time():
		emit_signal("time_out");
		return
	_decrease();
	
