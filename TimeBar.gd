extends Line2D

signal time_out;

func _decrease():
	points[1].x -= 11.5;

func no_more_time():
	return points[1].x ==  0;

func _on_Timer_timeout():
	_decrease();
	if no_more_time():
		emit_signal("time_out");
		
