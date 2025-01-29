extends State
class_name MainMenuState

@export var main_menu : MainMenuScene

func enter(_previous_state : State) -> void:
	main_menu.show()

func exit() -> void:
	main_menu.hide()

func load_level() -> void:
	pass
