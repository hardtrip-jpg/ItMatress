extends InteractionComponent
class_name SuccessComponent

func interact() -> void:
	SignalManager.succeed_level.emit()
