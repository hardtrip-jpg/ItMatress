extends TextureRect
class_name LogoAnimation

@export var rot_tween : bool = true
@export var scale_tween : bool = true

func _ready() -> void:
	if rot_tween:
		var tween_rot := get_tree().create_tween().set_loops().set_trans(Tween.TRANS_SINE)
		var rot_time := randf_range(2,2.2)
		tween_rot.tween_property(self, "rotation", deg_to_rad(5), rot_time)
		tween_rot.tween_property(self, "rotation", deg_to_rad(-5), rot_time)
	
	if scale_tween:
		var scale_time := randf_range(1.15,1.35)
		var tween_scale := get_tree().create_tween().set_loops().set_trans(Tween.TRANS_SINE)
		tween_scale.tween_property(self, "scale", Vector2(0.8,0.8), scale_time)
		tween_scale.tween_property(self, "scale", Vector2(1.1,1.1), scale_time)
