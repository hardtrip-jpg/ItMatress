extends InteractionComponent
class_name VaseBreakInteraction

@export var add_time := 5.0
@export var sprite : Sprite2D
@export var sound : AudioStreamPlayer2D

func interact() -> void:
	SignalManager.add_to_timer.emit(add_time)
	sprite.hide()
	sound.play()
