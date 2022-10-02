extends Node2D

func _on_ClientNext_pressed() -> void:
	$AnimationPlayer.play("MoveCameraToClient")
	$CoffeeMachine/Next.hide()
	$Clients.add_client(Global.cup_selected.client)
	
func _on_CupsOrdersNext_pressed() -> void:
	$AnimationPlayer.play("MoveCameraToCups")

func _on_CupsOrders_preparation_started() -> void:
	$AnimationPlayer.play("MoveCameraToPreparation")
	$CoffeeMachine/Next.show()

func _on_Clients_client_selected(client) -> void:
	assert(client)
	assert(Global.cup_selected)
	var cup_selected = Global.cup_selected
	if client.receive_cup(cup_selected.content):
		Global.cup_selected = null
		Global.nb_order_succeed += 1
	else:
		Global.nb_order_failed += 1
	$Clients.remove_client(client)
	
