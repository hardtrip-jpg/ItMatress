extends Control
class_name LevelTimer

@export var timer : Timer
@export var label : Label
@export var add_time_label : Label

var current_min : int = 0
var current_sec : int = 0
var current_micro : int = 0

func _ready() -> void:
	timer.timeout.connect(_timer_update)
	SignalManager.add_to_timer.connect(add_time)
	Console.add_command("start_timer", start_timer)
	Console.add_command("add_time", add_time_command, 1)

func start_timer() -> void:
	show()
	timer.start()

func stop_timer() -> void:
	timer.stop()
	Global.loaded_save.high_scores[Global.current_level] = {
		"min": current_min,
		"sec": current_sec,
		"micro": current_micro
	}
	print(Global.loaded_save.high_scores[Global.current_level])

func load_level() -> void:
	current_min = Global.current_level_data.min_required
	current_sec = Global.current_level_data.sec_required
	current_micro = Global.current_level_data.micro_required
	_update_label()
	hide()


func _timer_update() -> void:
	current_micro -= 1
	if current_micro < 0:
		current_micro = 9
		current_sec -= 1
	if current_sec < 0:
		current_sec = 59
		current_min -= 1
	_update_label()

func _update_label() -> void:
	var string_min := str(current_min)
	var string_sec := str(current_sec).pad_zeros(2)
	var string_micro := str(current_micro)
	
	label.text = "%s:%s.%s" % [string_min, string_sec, string_micro]
	
	
func add_time(time_added : float) -> void:
	current_sec -= time_added
	if current_sec < 0:
		print(current_sec)
		var new_sec := current_sec
		if current_min <= 0:
			SignalManager.fail_level.emit()
		current_min -= 1
		current_sec = 59 + new_sec
			
		
	_update_label()
	add_time_label.text = "-%s sec" % [time_added]
	add_time_label.modulate.a = 1
	add_time_label.position.y = 20
	var tween := get_tree().create_tween().set_ease(Tween.EASE_IN)
	tween.tween_property(add_time_label,"modulate:a", 0, 0.6)
	tween.parallel().tween_property(add_time_label,"position:y", 0, 0.6)

func add_time_command(input : String) -> void:
	add_time(float(input))
