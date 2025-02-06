extends Node2D
class_name Level

@export var level_data : LevelData

func _ready() -> void:
	Global.current_level_data = level_data
