extends Area2D

@onready var timer: Timer = $Timer
var _triggered := false

func _on_body_entered(body: Node2D) -> void:
	print("DEBUG: Something touched the killzone -> ", body.name)
	
	if _triggered:
		return
		
	if not body.is_in_group("Player"):
		print("DEBUG: It was ignored because it is NOT in the 'Player' group!")
		return

	print("DEBUG: Player detected! Starting timer...")
	_triggered = true
	
	# It's safer to disable monitoring safely at the end of the physics frame
	set_deferred("monitoring", false) 
	
	timer.start()

func _on_timer_timeout() -> void:
	print("DEBUG: Timer finished! Reloading scene...")
	get_tree().reload_current_scene()
