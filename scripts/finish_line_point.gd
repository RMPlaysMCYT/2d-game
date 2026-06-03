extends Area2D

@export var win_screen_path: NodePath
@onready var win_screen = get_node(win_screen_path)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		win_screen.visible = true
		win_screen.get_node("Panel/Score").set_value(body.Coins_Collected)
		get_tree().paused = true
