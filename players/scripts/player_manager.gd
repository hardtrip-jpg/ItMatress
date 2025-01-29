extends Node2D
class_name PlayerManager

@export var player_1 : PlayerController
@export var player_2 : PlayerController

func _ready() -> void:
	SignalManager.level_start.connect(level_start)
	SignalManager.succeed_level.connect(level_end)
	Console.add_command("levelstart", level_start)

func level_start() -> void:
	player_1.enabled = true
	player_2.enabled = true

func level_end() -> void:
	player_1.enabled = false
	player_2.enabled = false
