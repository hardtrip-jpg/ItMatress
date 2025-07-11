extends State
class_name SuccessGameState

@export var timer : LevelTimer
@export var success_screen : Control
@export var audio : AudioStreamPlayer

func enter(_previous_state : State) -> void:
	timer.stop_timer()
	success_screen.show()
	audio.play(0.3)
	Global.set_level(Global.loaded_save.furthest_level + 1)
	await get_tree().create_timer(4).timeout
	transition.emit("MainMenu")

func exit() -> void:
	success_screen.hide()
	timer.hide()
