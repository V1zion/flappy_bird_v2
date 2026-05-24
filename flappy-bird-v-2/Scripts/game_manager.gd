extends Node

func _ready() -> void:
	reset()

func reset():
	Global.game_running = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		Global.game_running = true
	if Global.game_running == true:
		pass
		# call PipeSpawner Timer
