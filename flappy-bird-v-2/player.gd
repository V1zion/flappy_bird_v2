extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

func _physics_process(delta: float) -> void:
	floor_max_angle = 0
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() == false:
		velocity.y = JUMP_VELOCITY
	

	move_and_slide()
