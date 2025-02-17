extends Button

@export var level_name : String
@export var level_id : int

func _ready() -> void:
	check_level()
	SignalManager.level_amount_updated.connect(check_level)

func _pressed() -> void:
	SignalManager.load_level.emit(level_name)

func check_level() -> void:
	if level_id > Global.loaded_save.furthest_level:
		print(name)
		disabled = true
	else:
		disabled = false
