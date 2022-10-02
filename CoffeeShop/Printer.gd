extends Sprite

func _ready() -> void:
	Global.connect("failed_orders_changed", self, "_on_failed_orders_changed")
	Global.connect("succeed_orders_changed", self, "_on_succeed_orders_changed")
	
func _on_succeed_orders_changed(value):
	$Succeed.text = String(value)
	
func _on_failed_orders_changed(value):
	$Failed.text = String(value)
	
