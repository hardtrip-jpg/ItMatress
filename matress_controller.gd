extends CharacterBody2D
class_name MatressController

@export var up : Marker2D
@export var down : Marker2D

var distance : float

func _ready() -> void:
	distance = up.global_position.distance_to(down.global_position)
	print(distance)

func _physics_process(delta: float) -> void:
	var input_1 := Input.get_vector(&"1_left",&"1_right",&"1_up",&"1_down")
	var input_2 := Input.get_vector(&"2_left",&"2_right",&"2_up",&"2_down")
	
	velocity = Vector2.ZERO
	
	calucalte_input(input_1, 1)
	
	move_and_slide()

func calucalte_input(input : Vector2, player : int) -> void:
	if input == Vector2.ZERO:
		return
	
	
