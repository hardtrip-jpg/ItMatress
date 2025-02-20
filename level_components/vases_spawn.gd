extends AnimatedSprite2D

func _ready() -> void:
	randomize()
	frame = randi_range(0,4)
