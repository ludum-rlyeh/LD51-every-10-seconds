extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_command(gm_name, command):
	$ClientName.text = gm_name
	$Command.text = command["base"]
	$ExtraSugar.visible = command["extraSugar"]
	$ExtraCream.visible = command["extraCream"]
	$ExtraGlass.visible = command["extraGlass"]
