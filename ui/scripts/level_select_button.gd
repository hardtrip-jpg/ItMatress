extends Button

@export var level_name : String
@export var level_id : int

func _ready() -> void:
	if level_id > Global.loaded_save.furthest_level:
		disabled = true

func _pressed() -> void:
	SignalManager.load_level.emit(level_name)
