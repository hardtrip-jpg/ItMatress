extends Node3D

func _ready() -> void:
	var tween := get_tree().create_tween().set_loops()
	tween.tween_property(self, "rotation_degrees.y", 180, 6)
	tween.tween_property(self, "rotation_degrees.y", -180, 6)
