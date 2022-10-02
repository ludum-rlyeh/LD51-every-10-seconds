extends CanvasLayer

func _ready():
	$Timer.text = "0 s"
	$SucceedOrders.text = "Succeed orders : 0"
	$FailedOrders.text = "Failed orders : 0"
	
	Global.connect("failed_orders_changed", self, "_on_failed_orders_changed")
	Global.connect("succeed_orders_changed", self, "_on_succeed_orders_changed")
	
func _on_succeed_orders_changed(value):
	$SucceedOrders.text = "Succeed orders : " + String(value)
	
func _on_failed_orders_changed(value):
	$FailedOrders.text = "Failed orders : " + String(value)

func _on_LoopTimer_time_changed(value) -> void:
	$Timer.text = String(value) + " s"
