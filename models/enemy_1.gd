extends Area2D

@onready var timer = $Timer2

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" and body.has_method("HarmedByAMob"):
		body.HarmedByAMob()
	timer.start()

func _on_timer_2_timeout() -> void:
	get_tree().reload_current_scene()


func _on_bomb_o_template_body_entered(body: Node2D) -> void:
	if body.name == "player" and body.has_method("HarmedByAMob"):
		body.HarmedByAMob()
	timer.start()


func _on_bomb_o_body_entered(body: Node2D) -> void:
	if body.name == "player" and body.has_method("HarmedByAMob"):
		body.HarmedByAMob()
	timer.start()
