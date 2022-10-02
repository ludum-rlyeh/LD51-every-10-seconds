extends Control

var _initial_position_coffee_container
var _initial_position_milkpot
var _initial_position_cup

func _ready():
	_initial_position_coffee_container = $CoffeeContainer.rect_global_position
	_initial_position_milkpot = $MilkPot.rect_global_position
	_initial_position_cup = $CupOpened.rect_global_position
	
	get_tree().call_group("CoffeeContainerGhost", "hide")
	get_tree().call_group("MilkPotGhost", "hide")
	get_tree().call_group("CupOpenedGhost", "hide")

func _fill_milk():
	$AnimationPlayer.play("FillMilk")
	if $MilkMachine.milk_pot :
		$MilkMachine.milk_pot.lock()
		yield($AnimationPlayer, "animation_finished")
		$MilkMachine.milk_pot.unlock()
		$MilkMachine.milk_pot.fill_cold_milk()
	if $MilkMachine.cup :
		$MilkMachine.cup.lock()
		yield($AnimationPlayer, "animation_finished")
		$MilkMachine.cup.unlock()
		$MilkMachine.cup.fill_cold_milk()
	
func _fill_coffee(quantity : int):
	var cup = $CoffeeMilkMachine.cup
	var coffee_container = $CoffeeMilkMachine.coffee_container
	$AnimationPlayer.play("CoffeeFill")
	if cup:
		cup.lock()
		yield($AnimationPlayer, "animation_finished")
		cup.unlock()
		if coffee_container \
		and coffee_container.full:
			cup.fill_coffee(quantity)
	if coffee_container :
		coffee_container.full = false
		
func _smash_coffee():
	$AnimationPlayer.play("CoffeeSmash")
	if $CoffeeSmasherMachine.coffee_container:
		$CoffeeSmasherMachine.coffee_container.lock()
		yield($AnimationPlayer, "animation_finished")
		$CoffeeSmasherMachine.coffee_container.get_node("Full").show()
		$CoffeeSmasherMachine.coffee_container.full = true
		$CoffeeSmasherMachine.coffee_container.unlock()
		
func _heat_milk():
	$AnimationPlayer.play("HeatMilk")
	if $CoffeeMilkMachine.milk_pot:
		$CoffeeMilkMachine.milk_pot.lock()
		yield($AnimationPlayer, "animation_finished")
		$CoffeeMilkMachine.milk_pot.unlock()
		$CoffeeMilkMachine.milk_pot.heat()
	
func _active_milk_controller():
	$MilkController.flip_h = not $MilkController.flip_h
	$MilkController.rect_rotation = 160 if $MilkController.rect_rotation == 0 else 0
	
func _on_Milk_pressed() -> void:
	_fill_milk()
	
func _on_Ristretto_pressed() -> void:
	_fill_coffee(Global.ristretto_water_quantity)

func _on_Expresso_pressed() -> void:
	_fill_coffee(Global.espresso_water_quantity)

func _on_Lungo_pressed() -> void:
	_fill_coffee(Global.lungo_water_quantity)

func _on_MilkController_pressed() -> void:
	_active_milk_controller()
	_heat_milk()

func _on_CoffeeMachineMilkPotGhost_pressed() -> void:
	$Hand.leave()
	$MilkPot.rect_global_position = $CoffeeMilkMachine/Milk/MilkPotGhost.rect_global_position
	$MilkMachine.milk_pot = $MilkPot
	get_tree().call_group("MilkPotGhost", "hide")

func _on_MilkMachineCupOpenedGhost_pressed() -> void:
	$Hand.leave()
	$CupOpened.rect_global_position = $MilkMachine/CupOpenedGhost.rect_global_position
	$MilkMachine.cup = $CupOpened
	get_tree().call_group("CupOpenedGhost", "hide")

func _on_MilkMachineMilkPotGhost_pressed() -> void:
	$Hand.leave()
	$MilkPot.rect_global_position = $MilkMachine/MilkPotGhost.rect_global_position
	$MilkMachine.milk_pot = $MilkPot
	get_tree().call_group("MilkPotGhost", "hide")

func _on_CoffeeSmasherCoffeeContainerGhost_pressed() -> void:
	$Hand.leave()	
	$CoffeeContainer.rect_global_position = $CoffeeSmasherMachine/CoffeeContainerGhost.rect_global_position
	$CoffeeSmasherMachine.coffee_container = $CoffeeContainer
	get_tree().call_group("CoffeeContainerGhost", "hide")
	_smash_coffee()

func _on_CoffeeMachineCoffeeContainerGhost_pressed() -> void:
	$Hand.leave()	
	$CoffeeContainer.rect_global_position = $CoffeeMilkMachine/Coffee/CoffeeContainerGhost.rect_global_position
	$CoffeeMilkMachine.coffee_container = $CoffeeContainer
	$CoffeeContainer/Full.hide()
	get_tree().call_group("CoffeeContainerGhost", "hide")
	
func _on_CoffeeContainerGhost_pressed() -> void:
	$Hand.leave()
	$CoffeeContainer.rect_global_position = $CoffeeContainerGhost.rect_global_position
	get_tree().call_group("CoffeeContainerGhost", "hide")

func _on_CoffeeMachineCupOpenedGhost_pressed() -> void:
	$Hand.leave()
	$CupOpened.rect_global_position = $CoffeeMilkMachine/Coffee/CupOpenedGhost.rect_global_position
	$CoffeeMilkMachine.cup = $CupOpened
	get_tree().call_group("CupOpenedGhost", "hide")
	
func _on_MilkPotGhost_pressed() -> void:
	$Hand.leave()
	$MilkPot.rect_global_position = $MilkPotGhost.rect_global_position
	get_tree().call_group("MilkPotGhost", "hide")

func _on_CoffeeContainer_pressed() -> void:
	if not $Hand.take($CoffeeContainer):
		return
	$CoffeeMilkMachine.coffee_container = null
	$CoffeeSmasherMachine.coffee_container = null
	$CoffeeContainer.rect_global_position = $Hand.global_position
	$Hand.full = true
	get_tree().call_group("CoffeeContainerGhost", "show")

func _on_MilkPot_pressed() -> void:
	if not $Hand.take($MilkPot):
		return
	$MilkMachine.milk_pot = null
	$CoffeeMilkMachine.milk_pot = null
	get_tree().call_group("MilkPotGhost", "show")

func _on_CupOpened_pressed() -> void:
	if not $Hand.take($CupOpened):
		return
	$MilkMachine.cup = null
	$CoffeeMilkMachine.cup = null
	$CupOpened.rect_global_position = $Hand.global_position
	get_tree().call_group("CupOpenedGhost", "show")
