extends Node

var _client_scene = load("res://Client/Client.tscn")
var _cup_button_scene = load("res://Cup/CupButton.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_client()

func new_client():
	var client_instance = _client_scene.instance()
	add_child(client_instance)
	var cup_button_instance = _cup_button_scene.instance()
	cup_button_instance.connect("pressed", self, "on_cup_button_click", [cup_button_instance, client_instance.gm_name, client_instance.command])
	add_child(cup_button_instance)

func on_cup_button_click(cup, gm_name, command):
	$CupCommand.set_command(gm_name, command)
	$CupCommand.visible = true
	cup.in_preparation = true
