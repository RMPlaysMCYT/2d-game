extends VBoxContainer

@onready var MenuLabels = $"../Label"
@onready var MenuLabels2 = $"../Label2"
@onready var OptionsLabel = $"../OptionsPanel/AudioPanel/Label3"
@onready var options = $"../OptionsPanel"
@onready var LevelSelectiones = $"../LevelSelection"

# Added @onready and changed "Audio" to "Master" (assuming default setup)
@onready var audio_bus_id = AudioServer.get_bus_index("Master") 
@onready var sfx_bus_id = AudioServer.get_bus_index("SFX")

func _ready()-> void:
	MenuLabels.show()
	MenuLabels2.show()
	show() # Replaced mainMenu.show()
	LevelSelectiones.hide()
	options.hide()
	OptionsLabel.hide()

func _on_start_pressed() -> void:
	MenuLabels.hide()
	MenuLabels2.hide()
	LevelSelectiones.show()
	
	#get_tree().change_scene_to_file("res://scenes/Scene1.tscn")

func _on_load_pressed() -> void:
	pass

func _on_options_pressed() -> void:
	hide() # Replaced mainMenu.hide()
	MenuLabels.hide()
	MenuLabels2.hide()
	options.show()
	OptionsLabel.show()

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_close_options_btn_pressed() -> void:
	visible = true # Replaced mainMenu.visible = true
	MenuLabels.visible = true
	MenuLabels2.visible = true
	options.visible = false
	OptionsLabel.visible = false
	
func _on_audio_slider_value_changed(value: float) -> void:
	# Divides by 100.0 assuming your slider goes from 0 to 100
	AudioServer.set_bus_volume_db(audio_bus_id, linear_to_db(value / 100.0))
	# Optional: completely mutes the bus if slider is at 0
	AudioServer.set_bus_mute(audio_bus_id, value == 0)

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus_id, linear_to_db(value / 100.0))
	AudioServer.set_bus_mute(sfx_bus_id, value == 0)

















func _on_LevelSelection_back_btn_pressed() -> void:
	MenuLabels.show()
	MenuLabels2.show()
	LevelSelectiones.hide()













func _on_level_1_btn_pressed() -> void:
	if LevelSelectionCore.level1_completed == false:
		get_tree().change_scene_to_file("res://scenes/Scene1.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/Scene1.tscn")


func _on_level_2_btn_pressed() -> void:
	if LevelSelectionCore.level1_completed == false:
		pass
	if LevelSelectionCore.level1_completed == true:
		get_tree().change_scene_to_file("res://scenes/Scene2.tscn")


func _on_level_3_btn_pressed() -> void:
	if LevelSelectionCore.level1_completed == false:
		null
	if LevelSelectionCore.level2_completed == true:
		get_tree().change_scene_to_file("res://scenes/Scene3.tscn")


func _on_level_4_btn_pressed() -> void:
	if LevelSelectionCore.level1_completed == false:
		null
	if LevelSelectionCore.level3_completed == true:
		get_tree().change_scene_to_file("res://scenes/Scene4.tscn")


func _on_level_5_btn_pressed() -> void:
	if LevelSelectionCore.level4_completed == false:
		get_tree().change_scene_to_file("res://scenes/Scene5.tscn")
	if LevelSelectionCore.level4_completed == true:
		get_tree().change_scene_to_file("res://scenes/Scene5.tscn")


func _on_level_6_btn_pressed() -> void:
	if LevelSelectionCore.level5_completed == false:
		get_tree().change_scene_to_file("res://scenes/Scene6.tscn")
	if LevelSelectionCore.level5_completed == true:
		get_tree().change_scene_to_file("res://scenes/Scene6.tscn")
