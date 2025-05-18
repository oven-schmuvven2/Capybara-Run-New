extends CharacterBody2D

var speed = 60

var moving_down = true

func _physics_process(delta):
	velocity.y = speed
	
	if $RayCastDown.is_colliding():
		moving_down = false
		flip()
	
	if $RayCastUp.is_colliding():
		moving_down = true
		flip()
	
	move_and_slide()

func flip():
	if moving_down:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body.handle_danger()
