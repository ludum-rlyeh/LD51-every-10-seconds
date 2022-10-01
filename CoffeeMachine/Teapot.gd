extends TextureButton

var locked = false
var filled = false
var hot = false

var capacity = 100 # ml
var held = false
var in_milk_machine = false
var in_coffee_machine = false
var is_over_cup = false

func lock():
	locked = true

func unlock():
	locked = false

func fill():
	filled = true
	
func unfill():
	filled = false
	
func heat():
	hot = true
	
func cold():
	hot = false
