extends Node2D

@export var start_pos : Vector2 = Vector2(0,0)
@export var pipe_speed : int = 500
var delete_distance : int = -1000

func _process(delta: float) -> void:
	if Global.game_running == true:
		move(delta)
		delete()

func move(delta: float) -> void:
	position.x -= pipe_speed * delta

func delete():
	if position.x <= delete_distance:
		queue_free()
