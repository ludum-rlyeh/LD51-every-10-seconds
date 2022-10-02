extends Sprite

func update_value(value):
	var clock = String(value)
	clock = clock.pad_decimals(2)
	clock = clock.pad_zeros(2)
	clock = clock.replace(".", ":")
	$Label.text = clock
