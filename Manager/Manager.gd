extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("loop_time_out", self, "on_timer_out")


func on_timer_out():
	$AnimationPlayer.play("angry")
	$AudioStreamPlayer.play()


func _on_Sprite_pressed():
	$Sprite/CoffeeMark.visible = true
	$AnimationPlayer.play("angry")
	$AudioStreamPlayer.play()
	# TODO: yield animation ending
	# TODO: connect to go outside
