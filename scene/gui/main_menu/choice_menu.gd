extends CanvasLayer

var battle_scene: PackedScene = preload("res://scene/battle/battle_level.tscn")

func _on_button_pressed() -> void:
	var battle: Node2D = battle_scene.instantiate()
	battle.entitie
	
