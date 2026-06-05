extends Button

@onready var finish_ui = $"../.."

func _on_pressed() -> void:
	get_tree().paused = false
	finish_ui.queue_free()
	get_tree().change_scene_to_file("res://ui/Main.tscn")
	
func _onNextLevelBtnPressed()-> void:
	pass
