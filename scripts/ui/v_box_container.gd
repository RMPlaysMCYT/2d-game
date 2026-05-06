extends VBoxContainer

@onready var MenuLabels = $"../Label"
@onready var MenuLabels2 = $"../Label2"
@onready var OptionsLabel = $"../Label3"
@onready var mainMenu = $"."
@onready var options = $"../OptionsPanel"

var audio_bus_id = AudioServer.get_bus_index("Audio")
var sfx_bus_id = AudioServer.get_bus_index("SFX")

func _ready()-> void:
	MenuLabels.show()
	MenuLabels2.show()
	mainMenu.show()
	options.hide()
	OptionsLabel.hide()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Scene1.tscn")


func _on_load_pressed() -> void:
	pass # Replace with function body.


func _on_options_pressed() -> void:
	mainMenu.hide()
	MenuLabels.hide()
	MenuLabels2.hide()
	options.show()
	OptionsLabel.show()


func _on_exit_pressed() -> void:
	get_tree().quit()





func _on_close_options_btn_pressed() -> void:
	mainMenu.visible = true
	MenuLabels.visible = true
	MenuLabels2.visible = true
	options.visible = false
	OptionsLabel.visible = false
	


func _on_audio_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id, linear_to_db(value))
	



func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus_id, linear_to_db(value))
