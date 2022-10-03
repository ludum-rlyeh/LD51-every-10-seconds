extends Sprite

var _obj 

func take(obj):
	$Take.play()
	if _obj:
		return false
	obj.rect_global_position = self.global_position
	_obj = obj
	return true
	
func has(obj):
	return _obj == obj
	
func leave():
	$Drop.play()
	_obj = null
