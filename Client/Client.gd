extends TextureButton

var real_name = "Adrian"
var gm_name = "Alian"

var command = "Expresso"

# Called when the node enters the scene tree for the first time.
func _ready():
	command["base"] = Global.receipes.keys()[randi() % Global.receipes.keys().size()]

func receive_cup(cupServed) -> bool:
	var wantedReceipe = Global.receipes["base"]
	print(cupServed)
	print(wantedReceipe)
	var nb_elements_ok = wantedReceipe.keys().size()
	for key in wantedReceipe:
		if cupServed.has(key):
			if cupServed[key] != wantedReceipe[key]:
				nb_elements_ok -= 1
	generate_emotion(nb_elements_ok)
	return nb_elements_ok == wantedReceipe.keys().size()

func generate_emotion(nb_elements_ok):
	pass
