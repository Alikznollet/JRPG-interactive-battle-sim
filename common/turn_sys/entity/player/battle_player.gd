extends BattleAlly
class_name BattlePlayer

func make_move_selection() -> void:
	current_action = Action.new()
	current_action.name = "player"
	
	$BattleChoiceMenu.show()
	
	await $BattleChoiceMenu.battle_choice_made
	move_locked_in.emit()
	
	$BattleChoiceMenu.hide()
