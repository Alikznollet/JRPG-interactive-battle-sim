extends BattleEntity
class_name BattleEnemy

func make_move_selection() -> void:
	current_action = Action.new()
	
	await get_tree().create_timer(0.5).timeout
	move_locked_in.emit()
