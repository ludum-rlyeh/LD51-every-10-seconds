extends Node2D

signal preparation_started
signal cup_picked

var _client_scene = load("res://Client/Client.tscn")
var _cup_scene = load("res://Cup/CupButton.tscn")

func _ready():
	randomize()
	new_client()
	new_client()
	new_client()
	
func new_client():
	var client_instance = _client_scene.instance()
	$ClientsQueue.add_child(client_instance)
	var cup_instance = _cup_scene.instance()
	cup_instance.client = client_instance
	cup_instance.connect("pressed", self, "_on_cup_clicked", [cup_instance, client_instance.gm_name, client_instance.command])
	$CupsQueue.add_child(cup_instance)
	
func _on_cup_clicked(cup, gm_name, command):
	$CupCommand.set_command(gm_name, command)
	$CupCommand.show()
	cup.in_preparation = true
	$CupsQueue.remove_child(cup)
	$ClientsQueue.remove_child(cup.client)
	emit_signal("cup_picked", cup.client)
	cup.queue_free()
	
func _on_CupCommand_pressed() -> void:
	emit_signal("preparation_started")
	$CupCommand.hide()
	new_client()
	
