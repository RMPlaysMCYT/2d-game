extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const MAXJUMPS = 2

var JumpCount = 0
var Coins_Collected: int = 0

@onready var animated_sprite = $AnimatedSprite2D

var is_attacking: bool = false
var combo_count: int = 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		JumpCount = 0

	if is_attacking:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		if Input.is_action_just_pressed("ui_accept") and JumpCount < MAXJUMPS :
			velocity.y = JUMP_VELOCITY
			JumpCount += 1

		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		update_animation(direction)
	move_and_slide()

func update_animation(direction):
	if is_attacking:
		return

	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	if not is_on_floor():
		if JumpCount > 1:
			animated_sprite.play("double_jump")
		else:
			animated_sprite.play("jump")
		
	else:
		if direction != 0:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")

@onready var ScoreCollected = get_node("./Main/player/Camera2D/CanvasLayer/Label")

func coinCollected(amount: int = 1)-> void:
	Coins_Collected += amount
	ScoreCollected.set_value(Coins_Collected)
