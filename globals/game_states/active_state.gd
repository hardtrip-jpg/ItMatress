extends State
class_name ActiveGameState

func enter(_previous_state : State) -> void:
	SignalManager.level_start.emit()
	await_success()


func await_success() -> void:
	await SignalManager.succeed_level
	transition.emit("Success")
