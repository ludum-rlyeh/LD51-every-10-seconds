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


func receive_cup(cupServed):
	var wantedReceipe = Global.receipes[command["base"]]
	var nb_elements_ok = wantedReceipe.keys().size()
	for key in wantedReceipe:
		if cupServed.has(key):
			if cupServed[key] != wantedReceipe[key]:
				nb_elements_ok =- 1
	generate_emotion(nb_elements_ok)

func generate_emotion(nb_elements_ok):
	pass
