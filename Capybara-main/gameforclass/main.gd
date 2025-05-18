extends Node

@export var available_levels: Array[LevelData]

@onready var _2d_scene = $"2DScrene"

func _ready() -> void:
	LevelManager.main_scene = _2d_scene
	LevelManager.levels = available_levels

func _on_pause_menu_game_paused() -> void:
	var Spiders = $"2DScrene"/Level/Spiders.get_children()
	var Jaguars = $"2DScrene"/Level/Jaguars.get_children()
	$"2DScrene"/Level/Player.SPEED = 0
	for v in Spiders:
		v.speed = 0
	for v in Jaguars:
		v.speed = 0

func _on_pause_menu_game_resumed() -> void:
	var Spiders = $"2DScrene"/Level/Spiders.get_children()
	var Jaguars = $"2DScrene"/Level/Jaguars.get_children()
	$"2DScrene"/Level/Player.SPEED = 220
	for v in Spiders:
		if v.moving_down:
			v.speed = 60
		else:
			v.speed = -60
	for v in Jaguars:
		if v.facing_right:
			v.speed = 60
		else:
			v.speed = -60
