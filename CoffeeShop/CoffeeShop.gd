extends Node2D

func _on_CupPreparationNext_pressed() -> void:
	$AnimationPlayer.play("MoveCameraToPreparation")
	$CoffeeMachine/Next.show()

func _on_ClientNext_pressed() -> void:
	$AnimationPlayer.play("MoveCameraToClient")
	$CoffeeMachine/Next.hide()
	
func _on_CupsOrdersNext_pressed() -> void:
	$AnimationPlayer.play("MoveCameraToCups")
