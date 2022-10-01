extends Control

var _initial_position_coffee_container
var _initial_position_milkpot
var _initial_position_cup

var _coffee_container_held = false
var _milkpot_held = false
var _in_milk_area = false
var _in_coffee_machine_milk_area = false
var _in_coffee_smasher_area = false
var _in_coffee_machine_coffee_area = false
var _in_coffee_machine_cup_area = false
var _cup_held = false
var _is_milk_over_cup = false

func _ready():
	_initial_position_coffee_container = $CoffeeContainer.rect_global_position
	_initial_position_milkpot = $MilkPot.rect_global_position
	_initial_position_cup = $CupOpened.rect_global_position

func _process(delta: float) -> void:
	if _coffee_container_held:
		$CoffeeContainer.rect_global_position = self.get_global_mouse_position()
	elif _milkpot_held:
		$MilkPot.rect_global_position = self.get_global_mouse_position()
	elif _cup_held:
		$CupOpened.rect_global_position = self.get_global_mouse_position()
		
###### milkpot

func _on_MilkPot_button_up() -> void:
	if $MilkPot.locked:
		return
	_milkpot_held = false
	if _in_milk_area:
		$MilkPot.rect_global_position = $MilkMachine/Position2D.global_position
	elif _in_coffee_machine_milk_area:
		$MilkPot.rect_global_position = $CoffeeMilkMachine/Milk/Position2D.global_position
	elif _is_milk_over_cup:
		var milkpot = $MilkPot
		if not milkpot.filled:
			return
		$CupOpened.fill_hot_milk(milkpot.capacity) if milkpot.hot \
		else $CupOpened.fill_cold_milk(milkpot.capacity)
	else:
		$MilkPot.rect_global_position = _initial_position_milkpot
		
func _on_MilkPot_button_down() -> void:
	if $MilkPot.locked:
		return
	_milkpot_held = true
	
func _on_MilkPot_area_entered(area: Area2D) -> void:
	if area == $CoffeeMilkMachine/Milk/Area2D:
		_in_coffee_machine_milk_area = true
	elif area == $MilkMachine/Area2D:
		_in_milk_area = true

func _on_MilkPot_area_exited(area: Area2D) -> void:
	if area == $CoffeeMilkMachine/Milk/Area2D:
		_in_coffee_machine_milk_area = false
	elif area == $MilkMachine/Area2D:
		_in_milk_area = false
			
func _fill_milk():
	$AnimationPlayer.play("FillMilk")
	
func _on_Milk_pressed() -> void:
	if _in_milk_area:
		_fill_milk()
	
##### Coffee container
		
func _on_CoffeeContainer_button_up() -> void:
	if $CoffeeContainer.locked:
		return
	_coffee_container_held = false
	if _in_coffee_smasher_area:
		$CoffeeContainer.rect_global_position = $CoffeeSmasherMachine/Position2D.global_position
		$AnimationPlayer.play("CoffeeSmash")
	elif _in_coffee_machine_coffee_area and $CoffeeContainer/Full.visible:
		$CoffeeContainer.rect_global_position = $CoffeeMilkMachine/Coffee/ContainerPosition2D.global_position
		$CoffeeContainer/Full.hide()
	else:
		$CoffeeContainer.rect_global_position = _initial_position_coffee_container

func _on_CoffeeContainer_button_down() -> void:
	if $CoffeeContainer.locked:
		return
	_coffee_container_held = true

func _on_CoffeeContainer_area_entered(area: Area2D) -> void:
	if area == $CoffeeSmasherMachine/Area2D:
		_in_coffee_smasher_area = true
	elif area == $CoffeeMilkMachine/Coffee/ContainerArea2D:
		_in_coffee_machine_coffee_area = true

func _on_CoffeeContainer_area_exited(area: Area2D) -> void:
	if area == $CoffeeSmasherMachine/Area2D:
		_in_coffee_smasher_area = false
	elif area == $CoffeeMilkMachine/Coffee/ContainerArea2D:
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

func _on_CupOpened_area_entered(area: Area2D) -> void:
	if area == $CoffeeMilkMachine/Coffee/CupArea2D:
		_in_coffee_machine_cup_area = true
	elif area == $MilkPot/Area2D:
		_is_milk_over_cup = true
		
	
func _on_CupOpened_area_exited(area: Area2D) -> void:
	if area == $CoffeeMilkMachine/Coffee/CupArea2D:
		_in_coffee_machine_cup_area = false

func _on_CupOpened_button_down() -> void:
	if $CupOpened.locked:
		return
	_cup_held = true

func _on_CupOpened_button_up() -> void:
	if $CupOpened.locked:
		return
	_cup_held = false
	if _in_coffee_machine_cup_area:
		$CupOpened.rect_global_position = $CoffeeMilkMachine/Coffee/CupPosition2D.global_position
	else:
		$CupOpened.rect_global_position = _initial_position_cup
