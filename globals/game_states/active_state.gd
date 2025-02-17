extends State
class_name ActiveGameState

@export var audio : AudioStreamPlayer

func enter(_previous_state : State) -> void:
	audio.play(0.6)
	SignalManager.level_start.emit()

func physics_update(delata : float) -> void:
	await_success()
	await_failure()


func await_success() -> void:
	await SignalManager.succeed_level
	transition.emit("Success")

func await_failure() -> void:
	await SignalManager.fail_level
	transition.emit("Failure")

func exit() -> void:
	audio.stop()
	pass
