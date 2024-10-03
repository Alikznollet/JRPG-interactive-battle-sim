extends Resource
class_name ActionQueue

## This queue is emptied before the end of every turn.
## It allows entities to queue up actions and make selections
## first

signal queue_empty()

var queue: Array[Action] = []

## Appends the action at the end of the queue.
func add_to_queue(action: Action) -> void:
	queue.append(action)
	
## Executes all actions in the queue in order. 
func execute_actions() -> void:
	while !queue.is_empty():
		var action: Action = queue.pop_front()
		action.execute()
		await action.finished
