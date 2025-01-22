extends Node

var loaded_save : SaveResource

func _ready() -> void:
	Console.add_command("savelevel", set_level, ["New Level Amount"])
	Console.add_command("win", win)

func set_level(new : int) -> void:
	loaded_save.furthest_level = new

func win() -> void:
	SignalManager.succeed_level.emit()
