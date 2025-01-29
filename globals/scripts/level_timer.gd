extends Control
class_name LevelTimer

@export var timer : Timer
@export var label : Label

var current_time : float = 0.0
var current_min : int = 0
var current_sec : int = 0
var current_micro : int = 0

func _ready() -> void:
	timer.timeout.connect(_timer_update)
	Console.add_command("start_timer", start_timer)

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
	current_min = 0
	current_sec = 0
	current_micro = 0
	_update_label()
	hide()


func _timer_update() -> void:
	current_micro += 1
	if current_micro >= 10:
		current_micro = 0
		current_sec += 1
	if current_sec >= 60:
		current_sec = 0
		current_min += 1
	_update_label()

func _update_label() -> void:
	var string_min := str(current_min)
	var string_sec := str(current_sec).pad_zeros(2)
	var string_micro := str(current_micro)
	
	label.text = "%s:%s.%s" % [string_min, string_sec, string_micro]
	
	
