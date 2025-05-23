class_name Jaguar
extends CharacterBody2D

var speed = -60.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	
	if $RayCastSide.is_colliding():
		if $RayCastSide.get_collider() is not Player:
			flip()
	
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body.handle_danger()
