extends Node2D
class_name PlayerManager

@export var player_1 : PlayerController
@export var player_2 : PlayerController

func _ready() -> void:
	SignalManager.level_start.connect(level_start)
	Console.add_command("levelstart", level_start)
	level_start()

func level_start() -> void:
	player_1.enabled = true
	player_2.enabled = true
