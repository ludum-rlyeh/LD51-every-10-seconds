extends TextureButton

var locked = false
var filled = false
var hot = false

func reinit():
	locked = false
	filled = false
	hot = false
	
func lock():
	locked = true

func unlock():
	locked = false

func fill_cold_milk():
	print_debug("fill cold milk")
	filled = true
	
func unfill():
	print_debug("unfill milk")
	filled = false
	
func heat():
	print_debug("heat milk")
	hot = true
	
func cold():
	print_debug("cold milk")
	hot = false
