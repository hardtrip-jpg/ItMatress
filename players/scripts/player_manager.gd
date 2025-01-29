extends Node2D
class_name PlayerManager

@export var player_1 : PlayerController
@export var player_2 : PlayerController

func _ready() -> void:
	player_1.process_mode = Node.PROCESS_MODE_DISABLED
	player_2.process_mode = Node.PROCESS_MODE_DISABLED
	SignalManager.level_start.connect(level_start)

func level_start() -> void:
	player_1.process_mode = Node.PROCESS_MODE_INHERIT
	player_2.process_mode = Node.PROCESS_MODE_INHERIT
