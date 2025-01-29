extends State
class_name ActiveGameState

func enter(_previous_state : State) -> void:
	SignalManager.level_start.emit()
