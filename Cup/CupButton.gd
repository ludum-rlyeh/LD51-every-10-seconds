extends TextureButton

var held = false

var locked = false

func lock():
	locked = true

func unlock():
	locked = false

var client = null

var content = {
	"coffee": 0, # ml
	"hot milk": 0, # ml
	"cold milk": 0, # ml
	"nut sirop": 0, # shot
	"caramel sirop": 0, # shot
	"chocolate sirop": 0 # shot
}

var in_preparation = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fill_coffee(ml):
	print_debug("coffee " + String(ml))
	content["coffee"] += ml

func fill_hot_milk(ml):
	print_debug("hot milk " + String(ml))
	content["hot milk"] += ml

func fill_cold_milk(ml):
	print_debug("cold milk " + String(ml))
	content["cold milk"] += ml

func add_nut_sirop(shot):
	print_debug("nut sirop +1")	
	content["nut sirop"] += shot

func add_caramel_sirop(shot):
	print_debug("caramel sirop +1")	
	content["caramel sirop"] += shot

func add_chocolate_sirop(shot):
	print_debug("chocolate sirop +1")	
	content["chocolate sirop"] += shot
