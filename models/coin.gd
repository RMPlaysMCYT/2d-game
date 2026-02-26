extends Node2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.Coins_Collected += 1
		self.queue_free()
		print(body.Coins_Collected)
