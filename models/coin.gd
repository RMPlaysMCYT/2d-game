extends Node2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return

	if "Coins_Collected" in body:
		body.Coins_Collected += 1
		print("Coins Collected:", body.Coins_Collected)

	queue_free()
