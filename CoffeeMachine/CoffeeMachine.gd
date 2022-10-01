extends Control

var _initial_position_coffee_container
var _initial_position_milkpot
var _initial_position_cup

func _ready():
	_initial_position_coffee_container = $CoffeeContainer.rect_global_position
	_initial_position_milkpot = $MilkPot.rect_global_position
	_initial_position_cup = $CupOpened.rect_global_position

func _input(event) -> void:
	if not event is InputEventMouseMotion:
		return
	var translation = event.relative
	if $CoffeeContainer.held:
		$CoffeeContainer.rect_global_position += translation
	elif $MilkPot.held:
		$MilkPot.rect_global_position += translation
	elif $CupOpened.held:
		$CupOpened.rect_global_position += translation
		
###### milkpot

func _on_MilkPot_button_up() -> void:
	var milkpot = $MilkPot
	if milkpot.locked:
		return
	milkpot.held = false
	if milkpot.in_milk_machine:
		milkpot.rect_global_position = $MilkMachine/Position2D.global_position
	elif milkpot.in_coffee_machine:
		milkpot.rect_global_position = $CoffeeMilkMachine/Milk/Position2D.global_position
	elif milkpot.is_over_cup:
		if not milkpot.filled:
			return
		$CupOpened.fill_hot_milk(milkpot.capacity) if milkpot.hot \
		else $CupOpened.fill_cold_milk(milkpot.capacity)
	else:
		milkpot.rect_global_position = _initial_position_milkpot
		
func _on_MilkPot_button_down() -> void:
	if $MilkPot.locked:
		return
	$MilkPot.held = true
	
func _on_MilkPot_area_entered(area: Area2D) -> void:
	if area == $CoffeeMilkMachine/Milk/Area2D:
		$MilkPot.in_coffee_machine = true
	elif area == $MilkMachine/Area2D:
		$MilkPot.in_milk_machine = true

func _on_MilkPot_area_exited(area: Area2D) -> void:
	if area == $CoffeeMilkMachine/Milk/Area2D:
		$MilkPot.in_coffee_machine = false
	elif area == $MilkMachine/Area2D:
		$MilkPot.in_milk_machine = false
			
func _fill_milk():
	$AnimationPlayer.play("FillMilk")
	
func _on_Milk_pressed() -> void:
	if $MilkPot.in_milk_machine:
		_fill_milk()
	
##### Coffee container
		
func _on_CoffeeContainer_button_up() -> void:
	if $CoffeeContainer.locked:
		return
	$CoffeeContainer.held = false
	if $CoffeeContainer.in_smasher_coffee_machine:
		$CoffeeContainer.rect_global_position = $CoffeeSmasherMachine/Position2D.global_position
		$AnimationPlayer.play("CoffeeSmash")
	elif $CoffeeContainer.in_coffee_machine and $CoffeeContainer/Full.visible:
		$CoffeeContainer.rect_global_position = $CoffeeMilkMachine/Coffee/ContainerPosition2D.global_position
		$CoffeeContainer/Full.hide()
	else:
		$CoffeeContainer.rect_global_position = _initial_position_coffee_container

func _on_CoffeeContainer_button_down() -> void:
	if $CoffeeContainer.locked:
		return
	$CoffeeContainer.held = true

func _on_CoffeeContainer_area_entered(area: Area2D) -> void:
	if area == $CoffeeSmasherMachine/Area2D:
		$CoffeeContainer.in_smasher_coffee_machine = true
	elif area == $CoffeeMilkMachine/Coffee/ContainerArea2D:
		$CoffeeContainer.in_coffee_machine = true

func _on_CoffeeContainer_area_exited(area: Area2D) -> void:
	if area == $CoffeeSmasherMachine/Area2D:
		$CoffeeContainer.in_smasher_coffee_machine = false
	elif area == $CoffeeMilkMachine/Coffee/ContainerArea2D:
		$CoffeeContainer.in_coffee_machine = false
	
##### coffee machine buttons

func _on_Ristretto_pressed() -> void:
	_fill_coffee(7)

func _on_Expresso_pressed() -> void:
	_fill_coffee(12)

func _on_Lungo_pressed() -> void:
	_fill_coffee(20)

func _fill_coffee(quantity : int):
	$AnimationPlayer.play("CoffeeFill")
	if $CupOpened.in_coffee_machine:
		$CupOpened.fill_coffee(quantity)
	

### Milk heating

func _on_MilkController_pressed() -> void:
	if not $MilkPot.in_coffee_machine:
		return
	_active_milk_controller()
	$AnimationPlayer.play("HeatMilk")
	
func _active_milk_controller():
	$MilkController.flip_h = not $MilkController.flip_h
	$MilkController.rect_rotation = 160 if $MilkController.rect_rotation == 0 else 0

func _on_CupOpened_area_entered(area: Area2D) -> void:
	if area == $CoffeeMilkMachine/Coffee/CupArea2D:
		$CupOpened.in_coffee_machine = true
	elif area == $MilkPot/Area2D:
		$MilkPot.is_over_cup = true
	
func _on_CupOpened_area_exited(area: Area2D) -> void:
	if area == $CoffeeMilkMachine/Coffee/CupArea2D:
		$CupOpened.in_coffee_machine = false
	elif area == $MilkPot/Area2D:
		$MilkPot.is_over_cup = false

func _on_CupOpened_button_down() -> void:
	if $CupOpened.locked:
		return
	$CupOpened.held = true

func _on_CupOpened_button_up() -> void:
	if $CupOpened.locked:
		return
	$CupOpened.held = false
	if $CupOpened.in_coffee_machine:
		$CupOpened.rect_global_position = $CoffeeMilkMachine/Coffee/CupPosition2D.global_position
	else:
		$CupOpened.rect_global_position = _initial_position_cup
