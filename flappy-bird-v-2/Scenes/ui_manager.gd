extends Node

@export var hud : CanvasLayer
@export var pause_menu : CanvasLayer
@export var start_menu : CanvasLayer
@export var restart_screen : CanvasLayer

func _ready():
	Global.state_changed.connect(_on_state_changed)

func _on_state_changed(new_state: Global.State):
	match new_state:
		Global.State.MAIN_MENU:
			pass
		Global.State.AWAITING_PLAY:
			print("awaiting")
		Global.State.PLAYING:
			print("now playing")
		Global.State.PAUSED:
			print("paused")
		Global.State.GAME_OVER:
			print("game over")
