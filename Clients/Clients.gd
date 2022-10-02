extends Node2D

signal client_selected

func add_client(client):
	$Queue.add_child(client)
	
func remove_client(client):
	$Queue.remove_child(client)

func _on_client_pressed(client):
	emit_signal("client_selected", client)

func _on_Queue_child_entered_tree(node: Node) -> void:
	node.connect("pressed", self, "_on_client_pressed", [node])
