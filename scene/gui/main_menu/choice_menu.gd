extends CanvasLayer

var battle_scene: PackedScene = preload("res://scene/battle/battle_level.tscn")

func _on_button_pressed() -> void:
	Transition.change_scene(battle_scene)
	
