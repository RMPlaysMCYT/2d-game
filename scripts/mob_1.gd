extends Node2D

const speed: int = 40
var directiones: int = -1

@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_2d_left.is_colliding():
		directiones = 1
		animated_sprite_2d.flip_h = false
	if ray_cast_2d_right.is_colliding():
		directiones = -1
		animated_sprite_2d.flip_h = true
		
	position.x += speed * delta
