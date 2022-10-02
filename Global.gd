extends Node

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

var nb_order_succeed = 0 
var nb_order_failed = 0 
