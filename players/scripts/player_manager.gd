extends Node2D
class_name PlayerManager

@export var player_1 : PlayerController
@export var player_2 : PlayerController
@export var particles : Array[CPUParticles2D]
@export var sprites : Array[Sprite2D]

func _ready() -> void:
	SignalManager.level_start.connect(level_start)
	SignalManager.succeed_level.connect(level_end)
	SignalManager.fail_level.connect(level_end)
	SignalManager.dead.connect(dead)
	Console.add_command("levelstart", level_start)

func level_start() -> void:
	player_1.enabled = true
	player_2.enabled = true

func level_end() -> void:
	player_1.enabled = false
	player_2.enabled = false

func dead() -> void:
	for x in particles:
		x.emitting = true
	for x in sprites:
		x.hide()
