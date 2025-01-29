extends State
class_name SuccessGameState

@export var timer : LevelTimer
@export var success_screen : SuccessManager

func enter(_previous_state : State) -> void:
	timer.stop_timer()
	success_screen.show()
	await get_tree().create_timer(3).timeout
	SignalManager.load_level.emit("prototype_level")

func exit() -> void:
	success_screen.hide()
