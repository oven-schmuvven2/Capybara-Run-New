extends Node2D

@export var level_id : int
@export var level_start_pos : Node2D

func _ready() -> void:
	LevelManager.main_scene = _2d_scene
	LevelManager.levels = available_levels
