extends InteractionComponent
class_name DeathInteraction

func interact() -> void:
	SignalManager.dead.emit()
	SignalManager.fail_level.emit()
