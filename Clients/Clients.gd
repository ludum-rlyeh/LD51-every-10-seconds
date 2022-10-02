extends HBoxContainer

signal client_selected

func add_client(client):
	add_child(client)
	
func remove_client(client):
	remove_child(client)

func _on_client_pressed(client):
	emit_signal("client_selected", client)

func _on_new_client_waiting(client) -> void:
	add_client(client)
	client.connect("pressed", self, "_on_client_pressed", [client])
