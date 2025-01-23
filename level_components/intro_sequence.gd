extends Node2D
class_name IntroSequence

@export var animation_player : AnimationPlayer
@export var label : Label
@export var player : Node2D


func _ready() -> void:
	player.process_mode = Node.PROCESS_MODE_DISABLED
	await get_tree().create_timer(1).timeout
	SignalManager.start_timer.emit()
	player.process_mode = Node.PROCESS_MODE_INHERIT
