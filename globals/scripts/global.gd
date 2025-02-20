extends Node

var loaded_save : SaveResource = SaveResource.new(0)
var current_level : String

var current_level_data : LevelData

func _ready() -> void:
	Console.add_command("win", win)
	Console.add_command("setlevel", command_set_level, ["set_level"], 1, "Changes furthest completed level")

func command_set_level(level : String) -> void:
	if !int(level):
		return Console.print_error("Must enter an int", true)
	set_level(int(level))

func set_level(new : int) -> void:
	loaded_save.furthest_level = new
	Console.print_line(str(loaded_save.furthest_level))
	SignalManager.level_amount_updated.emit()

func win() -> void:
	SignalManager.succeed_level.emit()
