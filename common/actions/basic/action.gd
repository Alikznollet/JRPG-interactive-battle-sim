extends Resource
class_name Action

signal finished()

func execute() -> void:
	await Engine.get_main_loop().create_timer(1).timeout
	print("action")
	finished.emit()
