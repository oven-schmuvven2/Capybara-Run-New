extends Node

@export var available_levels: Array[LevelData]

@onready var _2d_scene = $"2DScrene"

func _ready() -> void:
	LevelManager.main_scene = _2d_scene
	LevelManager.levels = available_levels

func _on_pause_menu_game_paused() -> void:
	var Spiders
	if $"2DScrene"/Level/Spiders != null:
		Spiders = $"2DScrene"/Level/Spiders.get_children()
	else:
		Spiders = null
		
	var Jaguars
	if $"2DScrene"/Level/Jaguars != null:
		Jaguars = $"2DScrene"/Level/Jaguars.get_children()
	else:
		Jaguars = Array()
	
	if Spiders != null:
		for v in Spiders:
			v.speed = 0
			
	if Jaguars != null:
		for v in Jaguars:
			v.speed = 0

func _on_pause_menu_game_resumed() -> void:
	var Spiders
	if $"2DScrene"/Level/Spiders != null:
		Spiders = $"2DScrene"/Level/Spiders.get_children()
	else:
		Spiders = []
		
	var Jaguars
	if $"2DScrene"/Level/Jaguars != null:
		Jaguars = $"2DScrene"/Level/Jaguars.get_children()
	else:
		Jaguars = Array()
	
	if Spiders != null:
		for v in Spiders:
			if v.moving_down:
				v.speed = 60
			else:
				v.speed = -60

	if Jaguars != null:
		for v in Jaguars:
			if v.facing_right:
				v.speed = 60
			else:
				v.speed = -60
