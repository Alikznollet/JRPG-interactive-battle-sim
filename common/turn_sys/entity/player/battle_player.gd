extends BattleAlly
class_name BattlePlayer

func make_move_selection() -> void:
	current_action = Action.new()
	current_action.name = "player"
	
	await get_tree().create_timer(0.5).timeout
	move_locked_in.emit()
