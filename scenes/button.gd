extends Area2D

var only_once = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and only_once == false:
		only_once = true
		$AnimatedSprite2D.play("press")
		$ButtonWall/AnimatedSprite2D.play("move")
		$ButtonWall/CollisionShape2D.set_deferred("disabled", true)
