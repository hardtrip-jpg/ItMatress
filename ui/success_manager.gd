extends Control
class_name SuccessManager

@export var change_level_time := 3.0

func _ready() -> void:
	SignalManager.succeed_level.connect(succeed)

func succeed() -> void:
	show()
	print("yippie")
	await get_tree().create_timer(change_level_time).timeout
	SignalManager.load_level.emit("prototype_level")
	hide()
