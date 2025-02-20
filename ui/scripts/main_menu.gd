extends Control
class_name MainMenuScene

@export var play_button : Button
@export var quit_button : Button

@export var level_select : Control
@export var main_screen : Control

func _ready() -> void:
	play_button.pressed.connect(play_game)
	quit_button.pressed.connect(quit_game)
	main_screen.show()
	level_select.hide()

func play_game() -> void:
	main_screen.hide()
	level_select.show()

func quit_game() -> void:
	get_tree().quit()
	
func hide_level_select() -> void:
	main_screen.show()
	level_select.hide()
