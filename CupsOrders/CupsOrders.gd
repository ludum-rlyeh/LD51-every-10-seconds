extends Node2D

signal preparation_started
signal client_picked

var _cup_scene = load("res://Cup/CupButton.tscn")

func _add_cup(client):
	var cup_instance = _cup_scene.instance()
	cup_instance.client = client
	cup_instance.connect("pressed", self, "_on_cup_clicked", [cup_instance, client])
	$CupsQueue.add_child(cup_instance)
	
func _on_cup_clicked(cup, client):
	$CupCommand.set_command(client.gm_name, client.command)
	$CupCommand.show()
	$CupsQueue.remove_child(cup)
	emit_signal("client_picked", client)
	cup.queue_free()
	
func _on_CupCommand_pressed() -> void:
	emit_signal("preparation_started")
	$CupCommand.hide()

func _on_ClientsOrderingQueue_new_client(client) -> void:
	_add_cup(client)
