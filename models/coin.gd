extends Node2D
@onready var coin_collect: AudioStreamPlayer = $CoinCollect

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.coinCollected(1)
		coin_collect.play()
		await coin_collect.finished
		self.queue_free()
