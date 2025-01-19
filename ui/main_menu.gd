extends Control

@export var play_button : Button
@export var quit_button : Button

func _ready() -> void:
	play_button.pressed.connect(play_game)
	quit_button.pressed.connect(quit_game)

func play_game() -> void:
	SignalManager.load_level.emit("prototype_level")

func quit_game() -> void:
	get_tree().quit()
