extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("loop_time_out", self, "on_timer_out")


func on_timer_out():
	$AnimationPlayer.play("angry")
	$AudioStreamPlayer.play()


func _on_Sprite_pressed():
	$Sprite/CoffeeMark.visible = true
	$Sprite/AudioStreamPlayer2D.play()
	yield($Sprite/AudioStreamPlayer2D, "finished")
	$AnimationPlayer.play("angry")
	yield($AnimationPlayer, "animation_finished")
	# TODO: animation go out
	Global.emit_signal("go_out")
