extends Area2D

func _on_player_entered(body: Node2D) -> void:
	Global.current_game_state = Global.State.GAME_OVER
