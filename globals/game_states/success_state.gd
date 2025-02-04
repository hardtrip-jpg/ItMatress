extends State
class_name SuccessGameState

@export var timer : LevelTimer
@export var success_screen : SuccessManager
@export var audio : AudioStreamPlayer2D

func enter(_previous_state : State) -> void:
	timer.stop_timer()
	success_screen.show()
	audio.play(0.3)
	await get_tree().create_timer(4).timeout
	SignalManager.load_level.emit("prototype_level")

func exit() -> void:
	success_screen.hide()
