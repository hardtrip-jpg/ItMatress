extends Node2D
class_name LevelCameraManager

@export var camera : PhantomCamera2D
@export var animation : AnimationPlayer


func _ready() -> void:
	camera.priority = 2
	animation.play("intro")
	SignalManager.stop_intro.connect(stop_intro)

func stop_intro() -> void:
	camera.priority = 0
	animation.stop()
