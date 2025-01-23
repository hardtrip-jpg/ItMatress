extends Node2D
class_name IntroSequence

@export var animation_player : AnimationPlayer

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	SignalManager.start_timer.emit()
	pass
