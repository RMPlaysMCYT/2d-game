extends Area2D

@onready var music_bg: AudioStreamPlayer = $"../MusicBG"
@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" and body.has_method("HarmedByAMob"):
		body.HarmedByAMob()
	print("You Died")
	music_bg.stop()
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
