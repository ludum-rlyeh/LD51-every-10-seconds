extends Node

var _coffee_shop_scene = load("res://CoffeeShop/CoffeeShop.tscn")
var _victory_scene = load("res://Victory/Victory.tscn")
var coffee_shop_instance = null

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	coffee_shop_instance = _coffee_shop_scene.instance()
	add_child(coffee_shop_instance)
	Global.connect("go_out", self, "on_go_out_signal")

func on_go_out_signal():
	var victory_instance = _victory_scene.instance()
	call_deferred("remove_child", coffee_shop_instance)
	call_deferred("add_child", victory_instance)
