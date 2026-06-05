extends Control

@onready var ScoreLabel = $"../../ScoreLayerCanvas/ScoreBar"

func _ready() -> void:
	hide()
	# REQUIRED: allows this node to receive input even while the tree is paused
	# (so ESC can resume the game)
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("pause_game"):
		return
	# GUARD: if the game is already paused but THIS screen isn't visible,
	# something else paused it (e.g. Level Complete). Don't interfere.
	if get_tree().paused and not visible:
		return
	if get_tree().paused:
		resume()
	else:
		pause()

func pause() -> void:
	show()
	ScoreLabel.visible = false
	get_tree().paused = true
	get_tree().call_group("mobile_ui", "hide")

func resume() -> void:
	hide()
	ScoreLabel.visible = true
	get_tree().paused = false
	get_tree().call_group("mobile_ui", "on_game_resumed")

func _on_quit_btn_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/Main.tscn")

func _on_resume_butn_pressed() -> void:
	resume()
