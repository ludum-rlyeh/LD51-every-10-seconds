extends Node2D

func _on_ClientNext_pressed() -> void:
	$AnimationPlayer.play("MoveCameraToClient")
	$CoffeeMachine/Next.hide()
	$Clients.add_client(Global.cup_selected.client)
	
func _on_CupsOrders_preparation_started() -> void:
	$AnimationPlayer.play("MoveCameraToPreparation")
	$CoffeeMachine/Next.show()
	if not $LoopTimer.is_running:
		$LoopTimer.start()
	
func _on_Clients_client_selected(client) -> void:
	assert(client)
	assert(Global.cup_selected)
	var cup_selected = Global.cup_selected
	if client.receive_cup(cup_selected.content):
		Global.cup_selected = null
		Global.increase_succeed_orders()
	else:
		Global.increase_failed_orders()
	$Clients.remove_client(client)
	
	$AnimationPlayer.play("MoveCameraToCups")
	$LoopTimer.restart()

func _on_LoopTimer_time_out() -> void:
	pass # Replace with function body