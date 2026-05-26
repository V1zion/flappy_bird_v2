extends Node

var score : int = 0
@onready var score_label : Label = $"../../HudCanvasLayer/HudRoot/Label"
@onready var player : CharacterBody2D = $"../../World/Entities/CharacterBody2D"

@export var pipe_spawner : Timer
var pipe_scene = preload("res://Scenes/pipes.tscn")
const max_pipe_gap_size : int = 100
const min_pipe_gap_size : int = -100
var upper_gap_range : int
var lower_gap_range : int
const pipe_gap_decrement : int = 5

func _ready() -> void:
	reset()

func reset():
	Global.game_running = false
	Global.is_dead = false
	upper_gap_range = max_pipe_gap_size
	lower_gap_range = max_pipe_gap_size / 2
	player.reset()
	score = 0
	score_label.text = "SCORE " + str(score)
	get_tree().call_group("pipes", "delete")

func _process(delta: float) -> void:
	# Tjek om spil skal startes
	if Input.is_action_just_pressed("jump") and Global.game_running == false:
		reset()
		Global.game_running = true
		pipe_spawner.start()
		
	# Tjek om spil skal restartes
	if Input.is_action_just_pressed("jump") and Global.is_dead == true:
		reset()

# Genererer pipes
func _on_pipe_spawner_timeout() -> void:
	var pipe_instance = pipe_scene.instantiate()
	# Bestem pipe position og gap size
	pipe_instance.position = Vector2(1500, randi_range(-400, 200))
	pipe_instance.get_child(0).position.y -= randi_range(lower_gap_range, upper_gap_range)
	pipe_instance.get_child(1).position.y += randi_range(lower_gap_range, upper_gap_range)
	if upper_gap_range <= min_pipe_gap_size:
		upper_gap_range = min_pipe_gap_size
	else: 
		upper_gap_range -= pipe_gap_decrement
	if lower_gap_range <= min_pipe_gap_size:
		lower_gap_range = min_pipe_gap_size
	else: 
		lower_gap_range -= pipe_gap_decrement
	# Connect signaler fra collision med funktioner
	Global.player_scored.connect(increase_score)
	Global.player_died.connect(process_death)
	add_child(pipe_instance)

func process_death() -> void:
	Global.game_running = false
	Global.is_dead = true
	pipe_spawner.stop()

func increase_score() -> void:
	score += 1
	score_label.text = "SCORE " + str(score)
