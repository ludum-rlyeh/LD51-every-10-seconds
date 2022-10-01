extends TextureButton


var _client = null

var _content = {
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

func set_client(client):
	_client = client

func fill_coffee(ml):
	_content["coffee"] += ml

func fill_hot_milk(ml):
	_content["hot milk"] += ml

func fill_cold_milk(ml):
	_content["cold milk"] += ml

func add_nut_sirop(shot):
	_content["nut sirop"] += shot

func add_caramel_sirop(shot):
	_content["caramel sirop"] += shot

func add_chocolate_sirop(shot):
	_content["chocolate sirop"] += shot
