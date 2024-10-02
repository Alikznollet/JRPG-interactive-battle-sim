extends Node2D
class_name BattleLevel

var turn_queue: TurnQueue = TurnQueue.new()
var entities: Array[BattleEntity] = []

func _ready() -> void:
	entities.append_array(%Entities.get_children())
	entities.sort_custom(_sort_speed)
	turn_queue.initialize_starting_events(entities)
	
	next_turn()
	
func next_turn() -> void:
	var event: Event = turn_queue.get_next_event()
	event.start_event()
	
	await event.event_ended
	await get_tree().create_timer(0.5).timeout # THIS IS TEMPORARY TO AVOID CHAINED INPUTS
	
	turn_queue.add_to_queue(event)

	next_turn()

func _sort_speed(a: BattleEntity, b: BattleEntity) -> bool:
	if a.speed > b.speed:
		return true
	return false
