extends TextureButton

var held = false
var locked = false
var full = false

func lock():
	locked = true

func unlock():
	locked = false
