extends Node2D
class_name BattleLevel

var entities: Array[BattleEntity] = []
var turn_manager: TurnManager = TurnManager.new()

func _ready() -> void:
	turn_manager = TurnManager.new()
	
	turn_manager.instantiate_entities(entities)
	turn_manager.start_turn_cycle()
