extends Node2D

@export var start_pos : Vector2 = Vector2(0,0)
@export var pipe_speed : int = 500
var delete_distance : int = -1000

func _process(delta: float) -> void:
	if Global.current_game_state == Global.State.PLAYING:
		move(delta)
		if position.x <= delete_distance:
			delete()

func move(delta: float) -> void:
	position.x -= pipe_speed * delta

func delete():
	queue_free()

# Tjekker for collisions med player
func _on_score_area_player_entered(body: Node2D) -> void:
	Global.player_scored.emit(1)

func _on_lower_pipe_player_entered(body: Node2D) -> void:
	Global.current_game_state = Global.State.GAME_OVER
func _on_upper_pipe_player_entered(body: Node2D) -> void:
	Global.current_game_state = Global.State.GAME_OVER
