extends Resource
class_name SaveResource

var furthest_level : int

var level_1_highscore : float = 0
var level_2_highscore : float = 0
var level_3_highscore : float = 0
var level_4_highscore : float = 0
var level_5_highscore : float = 0
var level_6_highscore : float = 0

func _init(p_furthest_level : int) -> void:
	furthest_level = p_furthest_level
