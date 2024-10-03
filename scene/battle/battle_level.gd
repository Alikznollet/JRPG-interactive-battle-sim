extends Node2D
class_name BattleLevel

var turn_queue: TurnQueue = TurnQueue.new()
var action_queue: ActionQueue = ActionQueue.new()
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
	
	# temporary way of adding the action
	action_queue.add_to_queue(event.event_entity.current_action)
	
	await action_queue.execute_actions()
	print("actions finished")
	
	turn_queue.add_to_queue(event) # THIS WILL ADD THE DEFAULT TURN EVENT OVER AND OVER

	next_turn()

func _sort_speed(a: BattleEntity, b: BattleEntity) -> bool:
	if a.speed > b.speed:
		return true
	return false
