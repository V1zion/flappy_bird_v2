extends Node

var game_running : bool = false
var is_dead : bool = false

signal player_died
signal player_scored

enum State { MAIN_MENU, PLAYING, PAUSED, GAME_OVER }
signal state_changed(new_state: State)
var current_game_state: State = State.MAIN_MENU:
	set(value):
		current_game_state = value
		state_changed.emit(value)
