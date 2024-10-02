extends CanvasLayer

@export var packedScene: PackedScene

func _on_button_pressed() -> void:
	Transition.change_scene(packedScene)
	
