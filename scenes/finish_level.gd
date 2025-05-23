extends Area2D

@export var level : int

func _on_body_entered(body: Node2D) -> void:
	print("woah")
	LevelManager.load_level(level + 1)
