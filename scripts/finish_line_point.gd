extends Area2D

var _triggered := false

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player") or _triggered:
		return
	_triggered = true
	_show_win_screen(body.Coins_Collected)
	LevelSelectionCore.level1_completed = true

func _show_win_screen(coins: int) -> void:
	# A dedicated CanvasLayer at layer 128 guarantees this renders
	# above ALL game UI (HUD, camera layers, etc.)
	var canvas := CanvasLayer.new()
	canvas.layer = 128
	canvas.process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().root.add_child(canvas)

	var screen: Control = preload("res://ui/LevelComplete.tscn").instantiate()
	screen.process_mode = Node.PROCESS_MODE_ALWAYS
	canvas.add_child(screen)

	screen.get_node("Panel/Score").set_value(coins)
	get_tree().paused = true
