extends Resource
class_name TurnQueue

var queue: Array[Event] = []

func initialize_starting_events(entities: Array[BattleEntity]) -> void:
	for entity in entities:
		queue.append(entity.default_event)

func add_to_queue(event: Event) -> void:
	queue.append(event)

func get_next_event() -> Event:
	return queue.pop_front()
