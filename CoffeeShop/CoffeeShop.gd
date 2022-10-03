extends Node2D

func _on_ClientNext_pressed() -> void:
	$AnimationPlayer.play("MoveCameraToClient")
	$CoffeeMachine/Next.hide()
	
func _on_preparation_started() -> void:
	$CoffeeMachine.reinit()
	$CoffeeMachine/toCups.visible = false
	$CupsOrders/toPreparation.visible = false
	$CoffeeMachine/CupOpened.visible = true
	$AnimationPlayer.play("MoveCameraToPreparation")
	$CoffeeMachine/Next.show()
	if not $LoopTimer.is_running:
		$LoopTimer.start()
	
func _on_cup_given_to_client(client) -> void:
	if client.receive_cup($CoffeeMachine.get_cup_content()):
		Global.increase_succeed_orders()
	else:
		Global.increase_failed_orders()
	$ClientsWaitingQueue.remove_client(client)
	client.queue_free()
	$AnimationPlayer.play("MoveCameraToCups")
	$CoffeeMachine/toCups.visible = true
	$CupsOrders/toPreparation.visible = true
	$CoffeeMachine/CupOpened.visible = false
	$CoffeeMachine/Next.visible = false
	$LoopTimer.restart()

func _on_LoopTimer_time_out() -> void:
	$AnimationPlayer.play("MoveCameraToManager")
	Global.emit_signal("loop_time_out")


func _on_return_pressed():
	$AnimationPlayer.play("FromManagerToPreparation")
	$CoffeeMachine/Next.visible = $CoffeeMachine/CupOpened.visible


func _on_OutDoor_pressed():
	# TODO: Stop everythings
	# TODO: Animation
	Global.emit_signal("go_out")


func _on_toPreparation_pressed():
	$AnimationPlayer.play("MoveCameraToPreparation")


func _on_toCups_pressed():
	$AnimationPlayer.play("MoveCameraToCups")
