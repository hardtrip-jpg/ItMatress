extends State
class_name MainMenuState

@export var main_menu : MainMenuScene
@export var menu_music : AudioStreamPlayer

func enter(_previous_state : State) -> void:
	main_menu.process_mode = Node.PROCESS_MODE_INHERIT
	menu_music.play()
	main_menu.show()

func exit() -> void:
	main_menu.process_mode = Node.PROCESS_MODE_DISABLED
	menu_music.stop()
	main_menu.hide()

func load_level() -> void:
	pass
