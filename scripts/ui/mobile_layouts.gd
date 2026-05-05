extends CanvasLayer

var is_on_mobile: bool = false

func _ready() -> void:
	add_to_group("mobile_ui")
	Input.joy_connection_changed.connect(_on_joy_connection_changed)
	var OS_Name = OS.get_name()
	
	if OS_Name == "Android" or OS_Name == "iOS":
		is_on_mobile = true
		if Input.get_connected_joypads().size()>0:
			hide()
		else:
			show()
	else:
		hide()

func _on_joy_connection_changed(device_id: int, connected: bool) -> void:
	if not is_on_mobile:
		return
	if connected:
		hide()
	else:
		if Input.get_connected_joypads().size() == 0:
			show()
			
func _input(event: InputEvent) -> void:
	if not is_on_mobile:
		return
	if event is InputEventKey or event is InputEventMouseButton:
		hide()
	elif event is InputEventScreenTouch:
		if Input.get_connected_joypads().size() == 0:
			show()

func on_game_resumed() -> void:
	if is_on_mobile:
		if Input.get_connected_joypads().size() == 0:
			show()
