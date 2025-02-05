extends State
class_name IntroSequenceState

@export var timer : LevelTimer
@export var label : Label
@export var animated_sprite : AnimatedSprite2D
@export var animation_player : AnimationPlayer
@export var cutscene_music : AudioStreamPlayer

var can_end_cutscene : bool = false

func enter(_previous_state : State) -> void:
	can_end_cutscene = false
	timer.load_level()
	label.hide()
	animated_sprite.hide()
	cutscene_music.play()
	
	await get_tree().create_timer(1).timeout
	can_end_cutscene = true
	label.show()
	
	var tween := get_tree().create_tween()
	tween.tween_property(label,"modulate:a", 1, 1.3)

func update(delta : float) -> void:
	if can_end_cutscene == false:
		return
	
	if Input.is_anything_pressed():
		can_end_cutscene = false
		intro_sequence()

func exit() -> void:
	animated_sprite.hide()
	timer.start_timer()

func intro_sequence() -> void:
	cutscene_music.stop()
	var tween := get_tree().create_tween()
	tween.tween_property(label,"modulate:a", 0, 0.3)
	SignalManager.stop_intro.emit()
	await tween.finished
	label.hide()
	animated_sprite.show()
	animation_player.play("intro")
	await animation_player.animation_finished
	transition.emit("Active")
