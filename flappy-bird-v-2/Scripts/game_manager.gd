extends Node

@export var pipe_spawner : Timer
var pipe_scene = preload("res://Scenes/pipes.tscn")
const max_pipe_gap_size : int = 100
const min_pipe_gap_size : int = -100
var current_pipe_gap_size : int
const pipe_gap_decrement : int = 5

func _ready() -> void:
	reset()

func reset():
	Global.game_running = false
	current_pipe_gap_size = max_pipe_gap_size

func _process(delta: float) -> void:
	# Tjek om spil skal startes
	if Input.is_action_just_pressed("jump") and Global.game_running == false:
		Global.game_running = true
		pipe_spawner.start()

# Genererer pipes
func _on_pipe_spawner_timeout() -> void:
	var pipe_instance = pipe_scene.instantiate()
	pipe_instance.position = Vector2(1500, randi_range(-400, 200))
	pipe_instance.get_child(0).position.y -= randi_range(min_pipe_gap_size, current_pipe_gap_size)
	pipe_instance.get_child(1).position.y += randi_range(min_pipe_gap_size, current_pipe_gap_size)
	if current_pipe_gap_size <= min_pipe_gap_size:
		current_pipe_gap_size = min_pipe_gap_size
	else: 
		current_pipe_gap_size -= pipe_gap_decrement

	add_child(pipe_instance)
