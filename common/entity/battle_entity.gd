extends Area2D
class_name BattleEntity

signal move_locked_in(action: Action)
var current_action: Action

@export var default_event: Event
@export var speed: float = 5.00
@export var health: float = 20.00

func _ready() -> void:
	default_event.event_entity = self

func make_move_selection() -> void:
	pass
