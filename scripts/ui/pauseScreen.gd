extends Control

func _ready():
	hide()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_screen"):
		if get_tree().paused:
			resume()
		else:
			pause()

func pause() -> void:
	show()
	get_tree().paused = true
	
func resume() -> void:
	hide()
	get_tree().paused = false

func _on_quit_btn_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/Main.tscn")


func _on_resume_butn_pressed() -> void:
	resume()
