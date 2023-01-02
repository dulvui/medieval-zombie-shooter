extends KinematicBody2D

onready var animated_sprite:AnimatedSprite = $AnimatedSprite
onready var colission_shape:CollisionShape2D = $CollisionShape2D 

const MIN_SPEED:float = 40.0
const MAX_SPEED:float = 120.0
const CENTER:Vector2 = Vector2(Global.SCREEN_WIDTH / 2, Global.SCREEN_HEIGHT / 2)

var is_alive:bool = true
var speed:float

func _ready():
	speed = rand_range(MIN_SPEED, MAX_SPEED)

func _physics_process(delta) -> void:
	if is_alive:
		var direction = (CENTER - global_position).normalized()
		look_at(CENTER)
		move_and_slide(direction * speed)
	
func die() -> void:
	is_alive = false
	animated_sprite.play("die")
	yield(animated_sprite, "animation_finished")
	queue_free()


func _on_HitDetector_area_entered(area) -> void:
	if is_alive:
		die()
