extends Sprite2D

@export var other_player : Sprite2D

func _physics_process(delta: float) -> void:
	look_at(other_player.global_position)
