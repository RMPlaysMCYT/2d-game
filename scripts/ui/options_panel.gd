extends Panel

# 1. Grab all the panels and buttons from the scene tree
@onready var audio_panel = $AudioPanel
@onready var controls_panel = $Controls
@onready var audio_btn = $AudioBtn
@onready var controls_btn = $ControlsBtn

var panels: Array[Panel] = []
var current_index: int = 0
var transition_duration: float = 0.4 # Seconds it takes to slide

func _ready() -> void:
	# Enable clipping so panels don't draw outside the main box
	clip_contents = true 
	
	# Store the panels in our array
	panels = [audio_panel, controls_panel]
	
	# Position them side-by-side on startup based on the main panel's width
	for i in range(panels.size()):
		panels[i].position.x = i * size.x 
		
	# Connect the new buttons to their functions!
	audio_btn.pressed.connect(_on_audio_btn_pressed)
	controls_btn.pressed.connect(_on_controls_btn_pressed)

func switch_to_panel(new_index: int) -> void:
	# Stop if we try to go out of bounds or switch to the panel we are already on
	if new_index < 0 or new_index >= panels.size() or new_index == current_index:
		return
		
	# Create the smooth animation (tween)
	var tween = create_tween().set_parallel(true)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	
	# Move every panel to its new relative position
	for i in range(panels.size()):
		var target_x = (i - new_index) * size.x
		tween.tween_property(panels[i], "position:x", target_x, transition_duration)
		
	current_index = new_index

# --- BUTTON SIGNAL RECEIVERS ---

func _on_audio_btn_pressed() -> void:
	# Audio is the first panel in our array, so its index is 0
	switch_to_panel(0)

func _on_controls_btn_pressed() -> void:
	# Controls is the second panel in our array, so its index is 1
	switch_to_panel(1)

# --- KEYBOARD INPUT HANDLING (Optional) ---

func _unhandled_input(event: InputEvent) -> void:
	# Switch using the TAB key
	if event.is_action_pressed("ui_focus_next"):
		var next_index = (current_index + 1) % panels.size()
		switch_to_panel(next_index)
		
	# Switch using the Left Arrow key
	elif event.is_action_pressed("ui_left"):
		var next_index = max(0, current_index - 1)
		switch_to_panel(next_index)
		
	# Switch using the Right Arrow key
	elif event.is_action_pressed("ui_right"):
		var next_index = min(panels.size() - 1, current_index + 1)
		switch_to_panel(next_index)
