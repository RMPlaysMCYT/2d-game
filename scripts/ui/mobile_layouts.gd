extends CanvasLayer

func _ready() -> void:
	var OS_Name = OS.get_name()
	
	if OS_Name == "Android" or OS_Name == "iOS":
		show()
	else:
		queue_free()
