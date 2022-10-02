extends HBoxContainer

signal new_client
signal client_is_waiting

var _client_scene = load("res://Client/Client.tscn")

func _ready():
	randomize()
	new_client()
	new_client()
	new_client()
	
func new_client():
	var client_instance = _client_scene.instance()
	add_child(client_instance)
	emit_signal("new_client", client_instance)

func _on_client_picked(client):
	remove_child(client)
	emit_signal("client_is_waiting", client)
	

func _on_command_prepared() -> void:
	yield(get_tree().create_timer(2), "timeout")
	new_client()
