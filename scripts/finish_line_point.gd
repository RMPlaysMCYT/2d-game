extends Area2D

const WIN_SCREEN = preload("res://ui/LevelComplete.tscn")

var triggered = false

func _ready() -> void:
	print("FinishLinePoint ready at position: ", global_position)

func _on_body_entered(body: Node2D) -> void:
	print("Something entered: ", body.name, " | is player: ", body.is_in_group("player"))
	if body.is_in_group("player") and not triggered:
		triggered = true
		print("Coins: ", body.Coins_Collected)
		var screen = WIN_SCREEN.instantiate()
		get_tree().root.add_child(screen)
		screen.get_node("Panel/Score").set_value(body.Coins_Collected)
		get_tree().paused = true
