extends Event
class_name EnemyChoiceEvent

func start_event() -> void:
	print("ENEMY choice event")
	event_entity.make_move_selection()
	await event_entity.move_locked_in
	event_ended.emit()
