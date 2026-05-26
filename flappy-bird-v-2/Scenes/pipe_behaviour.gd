extends Node2D

signal player_scored
signal player_died

@export var start_pos : Vector2 = Vector2(0,0)
@export var pipe_speed : int = 500
var delete_distance : int = -1000

func _process(delta: float) -> void:
	if Global.game_running == true:
		move(delta)
		if position.x <= delete_distance:
			delete()

func move(delta: float) -> void:
	position.x -= pipe_speed * delta

func delete():
	queue_free()

# Tjekker for collisions med player
func _on_score_area_player_entered(body: Node2D) -> void:
	Global.player_scored.emit()
func _on_lower_pipe_player_entered(body: Node2D) -> void:
	Global.player_died.emit()
func _on_upper_pipe_player_entered(body: Node2D) -> void:
	Global.player_died.emit()
