extends TextureRect
class_name LogoAnimation

func _ready() -> void:
	var tween_rot := get_tree().create_tween().set_loops().set_trans(Tween.TRANS_SINE)
	var tween_scale := get_tree().create_tween().set_loops().set_trans(Tween.TRANS_SINE)
	
	tween_rot.tween_property(self, "rotation", deg_to_rad(5), 2.1)
	tween_rot.tween_property(self, "rotation", deg_to_rad(-5), 2.1)
	tween_scale.tween_property(self, "scale", Vector2(0.8,0.8), 1.25)
	tween_scale.tween_property(self, "scale", Vector2(1.1,1.1), 1.25)
