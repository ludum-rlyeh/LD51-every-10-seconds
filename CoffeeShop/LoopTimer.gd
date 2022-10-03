extends Node

signal time_out
signal time_changed

class_name LoopTimer

var is_running = false
var value = 0 setget ,get_value
var late = false

func _process(delta):
	if is_running:
		value += delta
		emit_signal("time_changed", value)
		if not late and value >= 10:
			late = true
			emit_signal("time_out")
		
func restart():
	value = 0
	late = false
	
func start():
	value = 0
	is_running = true
	
func get_value() -> float:
	return value
