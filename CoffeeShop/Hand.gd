extends Sprite

var _obj 

func take(obj):
	if _obj:
		return false
	obj.rect_global_position = self.global_position
	_obj = obj
	return true
	
func leave():
	_obj = null
