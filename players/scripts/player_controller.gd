extends RigidBody2D
class_name PlayerController

@export var player_id : int = 1
@export var enabled : bool = false


func _physics_process(delta: float) -> void:
	if enabled == false:
		return
	
	var main_input_vector : Vector2
	match player_id:
		1:
			main_input_vector = Input.get_vector(&"1_left",&"1_right",&"1_up",&"1_down")
		2:
			main_input_vector = Input.get_vector(&"2_left",&"2_right",&"2_up",&"2_down")
	
	if main_input_vector:
		apply_central_impulse(main_input_vector * 10)
	elif linear_velocity != Vector2.ZERO:
		apply_central_impulse(-linear_velocity)
