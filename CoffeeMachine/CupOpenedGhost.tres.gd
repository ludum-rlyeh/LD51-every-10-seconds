extends TextureButton

var _switch = false

const _start_color = Color(1,1,1,0.3)
const _end_color = Color(1,1,1,0.8)

func _ready() -> void:
	$Tween.interpolate_property(self, "modulate", _start_color, _end_color, 1)
	$Tween.start()

func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	if _switch:
		$Tween.interpolate_property(self, "modulate", _start_color, _end_color, 1)
	else:
		$Tween.interpolate_property(self, "modulate", _end_color, _start_color, 1)
	$Tween.start()
	_switch = not _switch
		
