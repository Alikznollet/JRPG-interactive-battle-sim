extends CanvasLayer

var battle_scene: PackedScene = preload("res://common/turn_sys/main/turn_manager.tscn")
var player_scene: PackedScene = preload("res://common/turn_sys/entity/player/battle_player.tscn")
var enemy_scene: PackedScene = preload("res://common/turn_sys/entity/enemies/basic_enemy.tscn")

func _on_button_pressed() -> void:
	$Button.disabled = true
	$Button.hide()
	var battle: TurnManager = battle_scene.instantiate()
	
	var test_entities: Array[BattleEntity] = [player_scene.instantiate(), player_scene.instantiate(), enemy_scene.instantiate(), enemy_scene.instantiate()]
	get_tree().current_scene.add_child(battle)
	battle.instantiate_entities(test_entities)
	battle.start_turn_cycle()
	
