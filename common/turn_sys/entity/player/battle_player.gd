extends BattleAlly
class_name BattlePlayer

var gui_open: bool = false

func _process(delta: float) -> void:
	if gui_open:
		if Input.is_action_just_pressed("left_mouse"):
			current_action = Action.new()
			current_action.name = "player"
			move_locked_in.emit()
			gui_open = false

func make_move_selection() -> void:
	gui_open = true
