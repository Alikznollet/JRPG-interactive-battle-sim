extends Control

signal battle_choice_made()

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space") and visible:
		battle_choice_made.emit()
		
