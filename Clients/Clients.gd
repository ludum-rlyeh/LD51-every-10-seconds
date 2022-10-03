extends HBoxContainer

signal client_selected

var current_client = null

func add_client(client):
	current_client = client
	add_child(client)
	
func remove_client(client):
	current_client = null
	remove_child(client)

func _on_client_pressed(client):
	emit_signal("client_selected", client)

func _on_new_client_waiting(client) -> void:
	add_client(client)
	client.connect("pressed", self, "_on_client_pressed", [client])

func deactivate_client():
	if current_client:
		current_client.disabled = true

func activate_client():
	if current_client:
		current_client.disabled = false
