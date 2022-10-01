extends TextureButton

var locked = false
var filled = false
var hot = false

var capacity = 100 # ml

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
