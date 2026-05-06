extends Node2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.coinCollected(1)
		self.queue_free()
