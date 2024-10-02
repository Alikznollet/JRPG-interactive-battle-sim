extends Area2D
class_name BattleEntity

signal move_locked_in(action: Action)
var current_action: Action

@export var speed: float = 5.00

func make_move_selection() -> void:
	pass
