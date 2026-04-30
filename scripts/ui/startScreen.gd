extends VBoxContainer

@onready var mainMenu = $"."
@onready var options = $"../OptionsPanel"
@onready var PlayLevelScreen = $"../PlayLevelPanel"

var audio_bus_id = AudioServer.get_bus_index("Audio")
var sfx_bus_id = AudioServer.get_bus_index("SFX")


func _ready()-> void:
	get_tree().paused = false
	mainMenu.show()
	options.hide()
	PlayLevelScreen.hide()

func _on_start_pressed() -> void:
	PlayLevelScreen.visible = true
	mainMenu.visible = false


func _on_load_pressed() -> void:
	pass # Replace with function body.


func _on_options_pressed() -> void:
	mainMenu.hide()
	options.show()


func _on_exit_pressed() -> void:
	get_tree().quit()

# OPTIONS SCREEN
# OPTIONS SCREEN
func _on_close_options_btn_pressed() -> void:
	mainMenu.visible = true
	options.visible = false
	

func _on_audio_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id, linear_to_db(value))
	

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus_id, linear_to_db(value))




# PLAYSCREEN
# PLAYSCREEN



func _on_lv_l_1_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Scene1.tscn")


func _on_back_btn_level_pressed() -> void:
	PlayLevelScreen.visible = false
	mainMenu.visible = true
