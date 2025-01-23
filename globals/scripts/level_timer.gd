extends Control

@export var timer : Timer
@export var label : Label

var current_time : float = 0.0
var current_min : int = 0
var current_sec : int = 0
var current_micro : int = 0

func _ready() -> void:
	SignalManager.start_timer.connect(start_timer)
	SignalManager.stop_timer.connect(stop_timer)
	SignalManager.load_level.connect(load_level)
	timer.timeout.connect(timer_update)

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

func load_level(level : String) -> void:
	current_min = 0
	current_sec = 0
	current_micro = 0
	update_label()
	hide()

func timer_update() -> void:
	current_micro += 1
	if current_micro >= 10:
		current_micro = 0
		current_sec += 1
	if current_sec >= 60:
		current_sec = 0
		current_min += 1
	update_label()

func update_label() -> void:
	var string_min := str(current_min)
	var string_sec := str(current_sec).pad_zeros(2)
	var string_micro := str(current_micro)
	
	label.text = "%s:%s.%s" % [string_min, string_sec, string_micro]
	
	
