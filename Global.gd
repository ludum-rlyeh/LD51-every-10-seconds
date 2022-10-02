extends Node

signal loop_time_out
signal succeed_orders_changed
signal failed_orders_changed

const ristretto_water_quantity = 25
const espresso_water_quantity = 40
const lungo_water_quantity = 110
const milk_quantity = 250

var receipes = {
	"Ristretto": {
		"coffee": ristretto_water_quantity, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Espresso": {
		"coffee": espresso_water_quantity, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Lungo": {
		"coffee": lungo_water_quantity, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Macchiato": {
		"coffee": espresso_water_quantity, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 1, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Caramel Macchiato": {
		"coffee": espresso_water_quantity, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 1, # shot
		"caramel sirop": 1, # shot
		"chocolate sirop": 0 # shot
	},
	"Mocha": {
		"coffee": espresso_water_quantity, # ml
		"hot milk": milk_quantity, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 1 # shot
	},
	"Flat Milk": {
		"coffee": ristretto_water_quantity, # ml
		"hot milk": milk_quantity, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Viennese chocolate coffee": {
		"coffee": espresso_water_quantity, # ml
		"hot milk": 0, # ml
		"cold milk": milk_quantity, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 1 # shot
	}
}
var client_selected = null
var nb_succeed_orders = 0 
var nb_failed_orders = 0 

func increase_succeed_orders():
	nb_succeed_orders += 1
	emit_signal("succeed_orders_changed", nb_succeed_orders)
	
func increase_failed_orders():
	nb_failed_orders += 1
	emit_signal("failed_orders_changed", nb_failed_orders)

