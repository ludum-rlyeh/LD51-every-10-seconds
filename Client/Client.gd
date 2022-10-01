extends Node2D

export var real_name = "Adrian"
export var gm_name = "Alian"

export var command = {
	"base": "Expresso",
	"extraSugar": false,
	"extraCream": false,
	"extraGlass": true
}

# Called when the node enters the scene tree for the first time.
func _ready():
	command["base"] = Global.receipes.keys()[randi() % Global.receipes.keys().size()]
	command["extraSugar"] = bool(randi() % 2)
	command["extraCream"] = bool(randi() % 2)
	command["extraGlass"] = bool(randi() % 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
