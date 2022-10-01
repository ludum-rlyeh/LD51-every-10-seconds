extends Control

var _coffee_container_held = false
var _in_coffee_smasher_area = false
var _in_coffee_machine_coffee_area = false

func _on_MilkController_pressed() -> void:
	$MilkController.flip_h = not $MilkController.flip_h
	$MilkController.rect_rotation = 160 if $MilkController.rect_rotation == 0 else 0

func _process(delta: float) -> void:
	if _coffee_container_held:
		$CoffeeContainer.rect_global_position = self.get_global_mouse_position()

func _on_CoffeeContainer_button_up() -> void:
	_coffee_container_held = false
	if _in_coffee_smasher_area:
		$CoffeeContainer.rect_global_position = $CoffeeSmasher/Position2D.global_position
	if _in_coffee_machine_coffee_area:
		$CoffeeContainer.rect_global_position = $Machine/Position2D.global_position

func _on_CoffeeContainer_button_down() -> void:
	_coffee_container_held = true

func _on_Area2D_area_entered(area: Area2D) -> void:
	match(area.name):
		"CoffeeSmasherArea2D":
			_in_coffee_smasher_area = true
		"CoffeeMachineArea2D":
			_in_coffee_machine_coffee_area = true

func _on_Area2D_area_exited(area: Area2D) -> void:
	match(area.name):
		"CoffeeSmasherArea2D":
			_in_coffee_smasher_area = false
		"CoffeeMachineArea2D":
			_in_coffee_machine_coffee_area = false


func _on_Ristretto_pressed() -> void:
	pass # Replace with function body.

func _on_Expresso_pressed() -> void:
	pass # Replace with function body.

func _on_Lungo_pressed() -> void:
	pass # Replace with function body.
