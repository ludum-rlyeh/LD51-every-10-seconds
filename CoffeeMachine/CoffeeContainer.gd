extends TextureButton

var locked = false
var full = false

func lock():
	locked = true

func unlock():
	locked = false
	
func reinit():
	locked = false
	full = false
