extends KinematicBody2D

onready var animated_sprite:AnimatedSprite = $AnimatedSprite
onready var colission_shape:CollisionShape2D = $CollisionShape2D 

const SPEED:float = 60.0
const CENTER:Vector2 = Vector2(720/2, 1280/2)

var is_alive = true

func _physics_process(delta):
	if is_alive:
		var direction = (CENTER - global_position).normalized()
		look_at(CENTER)
		move_and_slide(direction * SPEED)
	
func die():
	is_alive = false
	colission_shape.queue_free()
	animated_sprite.play("die")
	yield(animated_sprite, "animation_finished")
	queue_free()


func _on_HitDetector_area_entered(area):
	die()
