extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var Coins_Collected: int = 0

@onready var animated_sprite = $AnimatedSprite2D

var is_attacking: bool = false
var combo_count: int = 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_attacking:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		update_animation(direction)

	move_and_slide()

func start_attack():
	is_attacking = true
	animated_sprite.play("attack" + str(combo_count))

	combo_count += 1
	if combo_count > 3:
		combo_count = 1

func update_animation(direction):
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

#func add_coin(amount: int = 1) -> void:
	#Coins_Collected += amount
