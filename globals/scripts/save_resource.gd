extends Resource
class_name SaveResource

var furthest_level : int

var high_scores : Dictionary[String, Dictionary] = {
	"prototype_level": {},
	"prototype_level_two": {},
	"prototype_level_three": {},
}

func _init(p_furthest_level : int) -> void:
	furthest_level = p_furthest_level
