extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_command(gm_name, command):
	$Client/Name.text = gm_name
	$Command/Name.text = command
