extends Node

signal player_scored

enum State { MAIN_MENU, AWAITING_PLAY, PLAYING, PAUSED, GAME_OVER }
var current_game_state: State = State.AWAITING_PLAY :
	set(value):
		if value == current_game_state:
			return
		current_game_state = value
		state_changed.emit(value)

signal state_changed(new_state: State)
