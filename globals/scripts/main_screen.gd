extends Control
class_name MainScreen

#@export var loading_screen : LoadingScreen
#@export var level_holder : Node
#
#var level_instance : Node
#var cur_level_path : String
#var loading := false
#
#func _ready() -> void:
	#Global.loaded_save = SaveResource.new(1)
	#SignalManager.load_level.connect(load_level)
	#Console.add_command("loadlevel", load_level, ["level_name"], 1, "Load a level based on scene name")
	#load_level("main_menu")
#
#func _process(delta: float) -> void:
	#if loading:
		#var progress := []
		#var status := ResourceLoader.load_threaded_get_status(cur_level_path, progress)
		#if status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			#Console.print_line(str(progress[0] * 100), true)
			#loading_screen.progress_bar.value = progress[0] * 100
		#elif status == ResourceLoader.THREAD_LOAD_LOADED:
			#loading = false
			#loading_screen.hide()
			#Console.print_line("Level Loaded", true)
			#change_scene(ResourceLoader.load_threaded_get(cur_level_path))
		#elif status == ResourceLoader.THREAD_LOAD_FAILED:
			#Console.print_error("%s failed to load" % cur_level_path, true)
			#loading = false
#
#func unload_level() -> void:
	#if is_instance_valid(level_instance):
		#level_instance.queue_free()
	#level_instance = null
#
#func load_level(level_name : String) -> void:
	#unload_level()
	#var level_path := "res://levels/%s.tscn" % level_name
	#
	#if level_path.is_absolute_path() == false:
		#Console.print_error("%s is not a valid level" % level_name, true)
		#return
	#
	#cur_level_path = level_path
	#Global.current_level = level_name
	#
	#loading_screen.show()
	#if(ResourceLoader.has_cached(level_path)):
		#ResourceLoader.load_threaded_get(level_path)
	#else:
		#ResourceLoader.load_threaded_request(level_path, "", true)
		#loading = true
#
#func change_scene(resource : PackedScene) -> void:
	#level_instance = resource.instantiate()
	#level_holder.add_child(level_instance)
	#
	#for x in level_holder.get_children():
		#if x != level_instance:
			#level_holder.remove_child(x)
			#x.queue_free()
