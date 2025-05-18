extends CanvasLayer


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	LevelManager.load_level(1)
