extends Control

signal game_paused
signal game_resumed

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pause"):
		show()
		game_paused.emit()

func _on_start_button_pressed() -> void:
	hide()
	game_resumed.emit()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_tree_entered() -> void:
	hide()
