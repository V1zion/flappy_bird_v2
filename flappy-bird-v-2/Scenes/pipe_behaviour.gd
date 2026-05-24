extends Node2D

@export var start_pos : Vector2 = Vector2(0,0)
@export var pipe_speed : int = 500
var delete_distance : int = -1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset()

func reset() -> void:
	position = start_pos

func _process(delta: float) -> void:
	if Global.game_running == true:
		move()

func move() -> void:
	position.x -= pipe_speed
