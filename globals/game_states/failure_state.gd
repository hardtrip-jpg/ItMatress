extends State
class_name FailureState

@export var timer : LevelTimer
@export var fail_screen : Control
@export var audio : AudioStreamPlayer

func enter(_previous_state : State) -> void:
	timer.stop_timer()
	fail_screen.show()
	audio.play(0.3)
	await get_tree().create_timer(4).timeout
	SignalManager.load_level.emit("prototype_level")

func exit() -> void:
	fail_screen.hide()
