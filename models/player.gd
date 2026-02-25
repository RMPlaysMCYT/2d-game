extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

@onready var animated_sprite = $AnimatedSprite2D

# --- NEW VARIABLES ---
var is_attacking: bool = false
var combo_count: int = 1 # Tracks if we are on attack 1, 2, or 3

#func _ready():
	## Connect the "animation_finished" signal via code
	## This tells Godot to run "_on_animated_sprite_2d_animation_finished" when an animation ends
	#animated_sprite.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# --- ATTACK INPUT ---
	# We only attack if we are NOT already attacking and we are on the floor
	#if Input.is_action_just_pressed("attack") and is_on_floor() and not is_attacking:
		#start_attack()

	# --- MOVEMENT LOGIC ---
	# We wrap movement in an 'else' so you can't walk while attacking
	if is_attacking:
		# Stop the character from sliding while swinging the sword
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		# Normal Movement (Jump & Walk)
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		# Only update walk/run animations if we are NOT attacking
		update_animation(direction)

	move_and_slide()

# --- NEW FUNCTION: TRIGGERS THE ATTACK ---
func start_attack():
	is_attacking = true
	
	# Play the animation based on the combo count (attack1, attack2, attack3)
	animated_sprite.play("attack" + str(combo_count))
	
	# Prepare the next number for the next click
	combo_count += 1
	if combo_count > 3:
		combo_count = 1

# --- NEW FUNCTION: HANDLES ANIMATION UPDATES ---
func update_animation(direction):
	# Crucial: If we are attacking, DO NOT change the animation to run/idle
	if is_attacking:
		return

	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if not is_on_floor():
		animated_sprite.play("jump")
	else:
		if direction != 0:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")

# --- SIGNAL: RUNS WHEN ANY ANIMATION FINISHES ---
#func _on_animation_finished():
	## If the animation that just finished was an attack...
	#if animated_sprite.animation.begins_with("attack"):
		#is_attacking = false
		## The character can now move again
