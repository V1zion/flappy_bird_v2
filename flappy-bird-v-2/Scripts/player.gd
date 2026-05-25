extends CharacterBody2D

const JUMP_VELOCITY : int = -500
const start_pos : Vector2 = Vector2(-400, 0)

func reset():
	position = start_pos

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
		# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() == false:
		velocity.y = JUMP_VELOCITY
	
	if Global.game_running == true:
		move_and_slide()
		
