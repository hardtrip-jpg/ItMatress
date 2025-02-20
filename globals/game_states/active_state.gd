extends State
class_name ActiveGameState

@export var audio : AudioStreamPlayer
@export var timer : LevelTimer

func enter(_previous_state : State) -> void:
	timer.start_timer()
	audio.play(0.6)
	SignalManager.level_start.emit()

func physics_update(delata : float) -> void:
	await_success()
	await_failure()
	
	if Input.is_action_just_pressed("ui_cancel"):
		transition.emit("MainMenu")


func await_success() -> void:
	await SignalManager.succeed_level
	transition.emit("Success")

func await_failure() -> void:
	await SignalManager.fail_level
	transition.emit("Failure")

func exit() -> void:
	audio.stop()
	timer.stop_timer()
	pass
