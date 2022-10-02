extends Node2D

var _current_client = null

func _on_ClientNext_pressed() -> void:
	$AnimationPlayer.play("MoveCameraToClient")
	$CoffeeMachine/Next.hide()
	
func _on_CupsOrders_preparation_started() -> void:
	$CoffeeMachine.reinit()
	$AnimationPlayer.play("MoveCameraToPreparation")
	$CoffeeMachine/Next.show()
	if not $LoopTimer.is_running:
		$LoopTimer.start()
	
func _on_Clients_client_selected(client) -> void:
	if client.receive_cup($CoffeeMachine.get_cup_content()):
		Global.increase_succeed_orders()
	else:
		Global.increase_failed_orders()
	$Clients.remove_client(client)
	client.queue_free()
	$AnimationPlayer.play("MoveCameraToCups")
	$LoopTimer.restart()

func _on_LoopTimer_time_out() -> void:
	pass # Replace with function body

func _on_CupsOrders_cup_picked(client) -> void:
	_current_client = client
	$Clients.add_client(client)
