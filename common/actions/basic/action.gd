extends Resource
class_name Action

var type: String = "attack"

signal finished()

func execute() -> void:
	await Engine.get_main_loop().create_timer(0.5).timeout
	print("action")
	finished.emit()
