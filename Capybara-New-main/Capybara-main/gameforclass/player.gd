class_name Player
extends CharacterBody2D

const SPEED = 220.0
const JUMP_VELOCITY = -200.0
const MAX_JUMP_PRESS_TIME = 0.2  # Maximum time in seconds to charge the jump
const MAX_JUMP_BOOST = 1.5  # Maximum multiplier for jump velocity

# Reference to the AnimatedSprite2D node
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var jump_press_time := 0.0  # Time the jump key has been pressed
var is_jumping := false  # Whether the character is currently jumping
var can_increase_jump := false  # Whether the jump height can still be increased
var can_control : bool = true

func _physics_process(delta: float) -> void:
	if not can_control: return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		is_jumping = false  # Reset jumping state when on the floor
		can_increase_jump = false  # Reset jump increase state

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		# Start the jump immediately
		velocity.y = JUMP_VELOCITY
		is_jumping = true
		can_increase_jump = true
		jump_press_time = 0.0

	# Increase jump height while the key is held, but only during the ascent and within the time limit
	if Input.is_action_pressed("ui_up") and is_jumping and can_increase_jump and velocity.y < 0:
		jump_press_time += delta
		# Stop increasing jump height after the maximum time is reached
		if jump_press_time >= MAX_JUMP_PRESS_TIME:
			can_increase_jump = false
		# Calculate the jump boost based on how long the key has been pressed
		var jump_boost = 1.0 + (jump_press_time / MAX_JUMP_PRESS_TIME) * (MAX_JUMP_BOOST - 1.0)
		velocity.y = JUMP_VELOCITY * jump_boost

	# Stop increasing jump height once the character starts falling
	if velocity.y >= 0:
		is_jumping = false
		can_increase_jump = false

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		# Flip the sprite based on the direction
		if direction > 0:
			animated_sprite.flip_h = true  # Flip to face left
		elif direction < 0:
			animated_sprite.flip_h = false  # Flip to face right

		# Play the "run" animation if the sprite is moving
		if animated_sprite.animation != "run":
			animated_sprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# Play the "idle" animation if the sprite is not moving
		if animated_sprite.animation != "idle":
			animated_sprite.play("idle")

	move_and_slide()
	if Input.is_action_pressed("kick"):
		$AnimatedSprite2D.play("kick")

func handle_danger() -> void:
	print("player died")
	visible = false
	can_control = false
	
	await get_tree().create_timer(1).timeout
	reset_player()

func reset_player() -> void:
	global_position = LevelManager.loaded_level.level_start_pos.global_position
	visible = true
	can_control = true
