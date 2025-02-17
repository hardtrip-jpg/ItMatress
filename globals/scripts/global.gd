extends Node

var loaded_save : SaveResource = SaveResource.new(0)
var current_level : String

var current_level_data : LevelData

func _ready() -> void:
	Console.add_command("savelevel", set_level, ["New Level Amount"])
	Console.add_command("win", win)

func set_level(new : int) -> void:
	loaded_save.furthest_level = new
	SignalManager.level_amount_updated.emit()

func win() -> void:
	SignalManager.succeed_level.emit()
