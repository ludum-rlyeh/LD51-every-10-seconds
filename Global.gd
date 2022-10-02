extends Node

signal loop_time_out
signal succeed_orders_changed
signal failed_orders_changed

var receipes = {
	"Ristretto": {
		"coffee": 2.5, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Expresso": {
		"coffee": 5, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Lungo": {
		"coffee": 7, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Macchiato": {
		"coffee": 5, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 1, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Caramel Macchiato": {
		"coffee": 5, # ml
		"hot milk": 0, # ml
		"cold milk": 0, # ml
		"nut sirop": 1, # shot
		"caramel sirop": 1, # shot
		"chocolate sirop": 0 # shot
	},
	"Mocha": {
		"coffee": 5, # ml
		"hot milk": 15, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 1 # shot
	},
	"Flat Milk": {
		"coffee": 5, # ml
		"hot milk": 25, # ml
		"cold milk": 0, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 0 # shot
	},
	"Viennese chocolate coffee": {
		"coffee": 0, # ml
		"hot milk": 0, # ml
		"cold milk": 25, # ml
		"nut sirop": 0, # shot
		"caramel sirop": 0, # shot
		"chocolate sirop": 1 # shot
	}
}

var cup_selected = null

var nb_succeed_orders = 0 
var nb_failed_orders = 0 

func increase_succeed_orders():
	nb_succeed_orders += 1
	emit_signal("succeed_orders_changed", nb_succeed_orders)
	
func increase_failed_orders():
	nb_failed_orders += 1
	emit_signal("failed_orders_changed", nb_failed_orders)

