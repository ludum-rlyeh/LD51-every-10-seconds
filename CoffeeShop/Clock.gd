extends Sprite

func update_value(value):
	if value > 10:
		$Label.add_color_override("font_color", Color(1, 0.2, 0.2))
	else:
		$Label.add_color_override("font_color", Color(0.9, 0.9, 0.9))

	var clock = String(value)
	clock = clock.pad_decimals(2)
	clock = clock.pad_zeros(2)
	clock = clock.replace(".", ":")
	$Label.text = clock
