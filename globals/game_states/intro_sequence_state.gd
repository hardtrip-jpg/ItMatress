extends State
class_name IntroSequenceState

@export var timer : LevelTimer
@export var intro : Control

func enter(_previous_state : State) -> void:
	intro.show()
	timer.load_level()
	await get_tree().create_timer(3).timeout
	transition.emit("Active")

func exit() -> void:
	intro.hide()
	timer.start_timer()
