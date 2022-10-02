extends Node2D

signal preparation_started

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
	cup_instance.connect("pressed", self, "_on_cup_clicked", [cup_instance, client_instance.gm_name, client_instance.command])
	cup_instance.client = client_instance
	$CupsQueue.add_child(cup_instance)
	
func _on_cup_clicked(cup, gm_name, command):
	$CupCommand.set_command(gm_name, command)
	$CupCommand.show()
	cup.in_preparation = true
	Global.cup_selected = cup
	$CupsQueue.remove_child(cup)
	
func _on_CupCommand_pressed() -> void:
	emit_signal("preparation_started")
	$ClientsQueue.remove_child(Global.cup_selected.client)
	$CupCommand.hide()
	new_client()
	
