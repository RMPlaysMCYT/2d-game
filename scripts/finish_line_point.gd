extends Area2D

# Set this in the Inspector for each level scene (1 through 6)
@export var level_number: int = 1

var _triggered := false

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player") or _triggered:
		return
	_triggered = true
	_mark_level_complete()
	_show_win_screen(body.Coins_Collected)

func _mark_level_complete() -> void:
	# Bug fix: was always hardcoded to level1_completed
	match level_number:
		1: LevelSelectionCore.level1_completed = true
		2: LevelSelectionCore.level2_completed = true
		3: LevelSelectionCore.level3_completed = true
		4: LevelSelectionCore.level4_completed = true
		5: LevelSelectionCore.level5_completed = true
		6: LevelSelectionCore.level6_completed = true

func _show_win_screen(coins: int) -> void:
	var canvas := CanvasLayer.new()
	canvas.layer = 128
	canvas.process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().root.add_child(canvas)

	var screen: Control = preload("res://ui/LevelComplete.tscn").instantiate()
	screen.process_mode = Node.PROCESS_MODE_ALWAYS
	canvas.add_child(screen)

	screen.get_node("Panel/Score").set_value(coins)
	get_tree().paused = true
