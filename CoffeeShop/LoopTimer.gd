extends Node

signal time_out
signal time_changed

class_name LoopTimer

var is_running = false
var value = 0 setget ,get_value

func _process(delta):
	if is_running:
		value += delta
		emit_signal("time_changed", value)
		if value >= 10:
			emit_signal("time_out")
		
func restart():
	value = 0
	
func start():
	value = 0
	is_running = true
	
func get_value() -> float:
	return value
