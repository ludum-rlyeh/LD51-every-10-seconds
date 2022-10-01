extends TextureButton

var held = false
var in_smasher_coffee_machine = false
var in_coffee_machine = false
var locked = false

func lock():
	locked = true

func unlock():
	locked = false
