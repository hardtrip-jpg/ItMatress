extends State
class_name IntroSequenceState

@export var timer : LevelTimer
@export var label : Label
@export var animated_sprite : AnimatedSprite2D

var can_end_cutscene : bool = false

func enter(_previous_state : State) -> void:
	can_end_cutscene = false
	timer.load_level()
	label.hide()
	animated_sprite.hide()
	
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
	var tween := get_tree().create_tween()
	tween.tween_property(label,"modulate:a", 0, 0.3)
	SignalManager.stop_intro.emit()
	await tween.finished
	label.hide()
	animated_sprite.frame = 0
	animated_sprite.show()
	await get_tree().create_timer(1).timeout
	animated_sprite.frame = 1
	await get_tree().create_timer(1).timeout
	animated_sprite.frame = 2
	await get_tree().create_timer(0.4).timeout
	transition.emit("Active")
