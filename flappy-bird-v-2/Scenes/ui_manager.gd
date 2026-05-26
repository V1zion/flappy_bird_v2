extends Node

@export var hud : CanvasLayer
@export var pause_menu : CanvasLayer
@export var start_menu : CanvasLayer
@export var restart_screen : CanvasLayer

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	Global.state_changed.connect(_on_state_changed)
	_on_state_changed(Global.current_game_state)

func _on_state_changed(state):
	match state:
		Global.State.PLAYING:
			hud.visible = true
			pause_menu.visible = false
			start_menu.visible = false
		Global.State.PAUSED:
			hud.hide()
			pause_menu.hide()
			start_menu.hide()
		Global.State.MAIN_MENU:
			hud.hide()
			pause_menu.hide()
			start_menu.hide()
		Global.State.GAME_OVER:
			hud.visible = false
			restart_screen.visible = true
