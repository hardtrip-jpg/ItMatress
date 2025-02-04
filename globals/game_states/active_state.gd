extends State
class_name ActiveGameState

@export var audio : AudioStreamPlayer2D

func enter(_previous_state : State) -> void:
	audio.play(0.6)
	SignalManager.level_start.emit()
	await_success()


func await_success() -> void:
	await SignalManager.succeed_level
	transition.emit("Success")

func exit() -> void:
	audio.stop()
	pass
