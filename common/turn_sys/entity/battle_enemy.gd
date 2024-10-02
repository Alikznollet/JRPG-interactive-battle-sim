extends BattleEntity
class_name BattleEnemy

func make_move_selection() -> void:
	current_action = Action.new()
	current_action.name = "enemy"
	move_locked_in.emit()
