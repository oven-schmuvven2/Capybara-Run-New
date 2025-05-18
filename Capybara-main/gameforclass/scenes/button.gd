extends Area2D

var only_once = false

func _on_body_entered(body: Node2D) -> void:
	print("woah")
	if body is Player:
		$AnimatedSprite2D.play("press")
		if only_once == false:
			only_once = true
			$ButtonWall/AnimatedSprite2D.play("move")
			$ButtonWall/CollisionShape2D.set_deferred("disabled", true)
