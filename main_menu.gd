class_name MainMenu
extends Control


func _on_start_button_pressed() -> void:
	LevelManager.load_level(1)
	deactivate()


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()

func deactivate() -> void:
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
	
func activate() -> void:
	show()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
