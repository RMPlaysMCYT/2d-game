extends Area2D

const WIN_SCREEN = preload("res://ui/LevelComplete.tscn")

var triggered = false

func _ready() -> void:
	print("FinishLinePoint ready at position: ", global_position)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not triggered:
		triggered = true
		var screen = WIN_SCREEN.instantiate()
		screen.process_mode = Node.PROCESS_MODE_ALWAYS  # add this
		get_tree().root.add_child(screen)
		screen.get_node("Panel/Score").set_value(body.Coins_Collected)
		get_tree().paused = true
