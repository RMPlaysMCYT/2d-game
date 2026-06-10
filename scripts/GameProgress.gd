# GameProgress.gd - Add as Autoload
extends Node

# Define level scenes directly here (simpler and avoids errors)
const LEVEL_SCENES = {
	1: "res://scenes/Scene1.tscn",
	2: "res://scenes/Scene2.tscn",
	3: "res://scenes/Scene3.tscn",
	4: "res://scenes/Scene4.tscn",
	5: "res://scenes/Scene5.tscn",
	6: "res://scenes/Scene6.tscn",
}

const SAVE_FILE = "user://game_progress.save"

var completed_levels: Array = [true, true, true, true, true, true]

func _ready():
	load_game()

func is_level_unlocked(level_number: int) -> bool:
	if level_number == 1:
		return true
	return completed_levels[level_number - 2]

func complete_level(level_number: int):
	print("🔥 COMPLETE_LEVEL called for level ", level_number)
	if level_number >= 1 and level_number <= 6:
		completed_levels[level_number - 1] = true
		save_game()
		print("✅ Level ", level_number, " completed!")
		print("📊 Progress: ", get_progress_text())
		debug_print_state()  # Add this line
	else:
		print("❌ Invalid level number: ", level_number)

func get_progress_text() -> String:
	var text = ""
	for i in range(6):
		text += "L" + str(i+1) + ":" + ("✓" if completed_levels[i] else "✗")
		if i < 5: text += ", "
	return text

func save_game():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	var save_data = {
		"completed_levels": completed_levels
	}
	var json_string = JSON.stringify(save_data)
	file.store_line(json_string)
	print("💾 Game saved!")

func load_game():
	if FileAccess.file_exists(SAVE_FILE):
		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
		var content = file.get_line()
		var save_data = JSON.parse_string(content)
		if save_data:
			completed_levels = save_data["completed_levels"]
			print("📀 Game loaded! Progress: ", get_progress_text())
	else:
		print("🆕 No save file found, starting fresh!")

func reset_progress():
	completed_levels = [true, true, true, true, true, true]
	save_game()
	print("🔄 Progress reset!")
	
# Add this function to GameProgress.gd
func debug_print_state():
	print("=== CURRENT GAME STATE ===")
	print("Completed levels: ", completed_levels)
	for i in range(6):
		print("  Level ", i+1, ": ", "✓" if completed_levels[i] else "✗", 
			  " | Unlocked: ", is_level_unlocked(i+1))
	print("==========================")
