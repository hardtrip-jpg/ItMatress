extends Resource
class_name LevelData

@export_category("Desired Times")
@export_group("Required")
@export var micro_required : int
@export var sec_required : int
@export var min_required :int
@export_group("Silver")
@export var micro_silver : int
@export var sec_silver : int
@export var min_silver : int
@export_group("Gold")
@export var micro_gold : int
@export var sec_gold : int
@export var min_gold : int

func _init(p_mc_r := 0.0, p_s_r := 0.0, p_mn_r := 0.0, p_mc_s := 0.0, p_s_s := 0.0, p_mn_s := 0.0, p_mc_g := 0.0, p_s_g := 0.0, p_mn_g := 0.0) -> void:
		micro_required = p_mc_r
		sec_required = p_s_r
		min_required = p_mn_r
		micro_silver = p_mc_s
		sec_silver = p_s_s
		min_silver = p_mn_s
		micro_gold = p_mc_g
		sec_gold = p_s_g
		min_gold = p_mn_g
