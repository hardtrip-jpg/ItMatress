extends Area2D
class_name InteractionArea

@export var interaction : InteractionComponent

func _ready() -> void:
	body_entered.connect(on_enter)

func on_enter(body: Node2D) -> void:
	monitoring = false
	interaction.interact()
