extends Control

var _initial_position_coffee_container
var _initial_position_teapot

var _coffee_container_held = false
var _teapot_held = false
var _in_milk_area = false
var _in_coffee_machine_milk_area = false
var _in_coffee_smasher_area = false
var _in_coffee_machine_coffee_area = false
var _is_coffee_container_locked = false

func _ready():
	_initial_position_coffee_container = $CoffeeContainer.rect_global_position
	_initial_position_teapot = $Teapot.rect_global_position

func _process(delta: float) -> void:
	if _coffee_container_held:
		$CoffeeContainer.rect_global_position = self.get_global_mouse_position()
	elif _teapot_held:
		$Teapot.rect_global_position = self.get_global_mouse_position()
		
###### Teapot

func _on_Teapot_button_up() -> void:
	if $Teapot.locked:
		return
	_teapot_held = false
	if _in_milk_area:
		$Teapot.rect_global_position = $Milk/Position2D.global_position
	elif _in_coffee_machine_milk_area:
		$Teapot.rect_global_position = $Machine/Milk/Position2D.global_position
	else:
		$Teapot.rect_global_position = _initial_position_teapot
		
func _on_Teapot_button_down() -> void:
	if $Teapot.locked:
		return
	_teapot_held = true
	
func _on_Teapot_area_entered(area: Area2D) -> void:
	match(area.name):
		"CoffeeMachineMilkArea2D":
			_in_coffee_machine_milk_area = true
		"MilkContainerArea2D":
			_in_milk_area = true

func _on_Teapot_area_exited(area: Area2D) -> void:
	match(area.name):
		"CoffeeMachineMilkArea2D":
			_in_coffee_machine_milk_area = false
		"MilkContainerArea2D":
			_in_milk_area = false
			
func _fill_milk():
	$AnimationPlayer.play("FillMilk")
	
func _on_Milk_pressed() -> void:
	if _in_milk_area:
		_fill_milk()
	
##### Coffee container
		
func _on_CoffeeContainer_button_up() -> void:
	if _is_coffee_container_locked:
		return
	_coffee_container_held = false
	if _in_coffee_smasher_area:
		$CoffeeContainer.rect_global_position = $CoffeeSmasher/Position2D.global_position
		$AnimationPlayer.play("CoffeeSmash")
	elif _in_coffee_machine_coffee_area and $CoffeeContainer/Full.visible:
		$CoffeeContainer.rect_global_position = $Machine/Coffee/Position2D.global_position
		$CoffeeContainer/Full.hide()
	else:
		$CoffeeContainer.rect_global_position = _initial_position_coffee_container

func _on_CoffeeContainer_button_down() -> void:
	if _is_coffee_container_locked:
		return
	_coffee_container_held = true

func _on_CoffeeContainer_area_entered(area: Area2D) -> void:
	match(area.name):
		"CoffeeSmasherArea2D":
			_in_coffee_smasher_area = true
		"CoffeeMachineArea2D":
			_in_coffee_machine_coffee_area = true

func _on_CoffeeContainer_area_exited(area: Area2D) -> void:
	match(area.name):
		"CoffeeSmasherArea2D":
			_in_coffee_smasher_area = false
		"CoffeeMachineArea2D":
			_in_coffee_machine_coffee_area = false
	
##### coffee machine buttons

func _on_Ristretto_pressed() -> void:
	_fill_coffee()

func _on_Expresso_pressed() -> void:
	_fill_coffee()

func _on_Lungo_pressed() -> void:
	_fill_coffee()

func _fill_coffee():
	$AnimationPlayer.play("CoffeeFill")

### Milk heating

func _on_MilkController_pressed() -> void:
	if not _in_coffee_machine_milk_area:
		return
	_active_milk_controller()
	$AnimationPlayer.play("HeatMilk")
	
func _active_milk_controller():
	$MilkController.flip_h = not $MilkController.flip_h
	$MilkController.rect_rotation = 160 if $MilkController.rect_rotation == 0 else 0
