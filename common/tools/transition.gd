extends Node

func change_scene(scene: PackedScene) -> void:
	get_tree().change_scene_to_packed(scene)
