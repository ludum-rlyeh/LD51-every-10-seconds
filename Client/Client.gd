extends TextureButton

var real_names = [
	"Ellen",
	"Steve",
	"Miranda",
	"Louis",
	"Eve",
	"Karen",
	"Avzgui",
	"Chtimy",
	"Henry",
	"Simone"
]
var gm_names = [
	"Eriall",
	"Sewd",
	"Merasha",
	"Loius",
	"Eing",
	"Korin",
	"Avzgui",
	"Chtimy",
	"Harii",
	"Smeilene"
]

var appearance = [
	preload("res://Client/client0.svg"),
	preload("res://Client/client1.svg"),
	preload("res://Client/client2.svg"),
	preload("res://Client/client3.svg"),
	preload("res://Client/client4.svg"),
	preload("res://Client/client5.svg"),
	preload("res://Client/client6.svg"),
	preload("res://Client/client7.svg"),
	preload("res://Client/client8.svg"),
	preload("res://Client/client9.svg")
]

var command = "Expresso"
var gm_name = "Alin"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set appearance
	var i = randi() % appearance.size()
	self.texture_normal = appearance[i]
	self.gm_name = gm_names[i]
	
	# Generate command
	command = Global.receipes.keys()[randi() % Global.receipes.keys().size()]

func receive_cup(cupServed) -> bool:
	var wantedReceipe = Global.receipes[command]
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
