extends Area2D
class_name InteractionArea

@export var interaction : InteractionComponent

func _ready() -> void:
	body_entered.connect(on_enter)

func on_enter(body: Node2D) -> void:
	var collision : CollisionShape2D = get_child(0)
	collision.disabled = true
	interaction.interact()
