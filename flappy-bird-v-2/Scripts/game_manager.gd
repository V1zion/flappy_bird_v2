extends Node

@export var pipe_spawner : Timer
var pipe_scene = preload("res://Scenes/pipes.tscn")

func _ready() -> void:
	reset()

func reset():
	Global.game_running = false

func _process(delta: float) -> void:
	# Tjek om spil skal startes
	if Input.is_action_just_pressed("jump") and Global.game_running == false:
		Global.game_running = true
		pipe_spawner.start()
	
	# Når spil er startet
	if Global.game_running == true: # Begynd at spawn pipes
		pass
		
	#print(Global.game_running)

# Genererer pipes
func _on_pipe_spawner_timeout() -> void:
	print("pipe created")
	var pipe_instance = pipe_scene.instantiate()
	pipe_instance.position = Vector2(1500, randi_range(-400, 250))
	add_child(pipe_instance)
	
