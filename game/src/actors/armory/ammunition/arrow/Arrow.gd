extends RigidBody2D

const SPEED:float = 860.0
var target

func shoot(target:Vector2, power:float) -> void:
	var direction = -(global_position - target).normalized()
	apply_central_impulse(Vector2(direction.x, direction.y) * SPEED * power)

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_AnimationPlayer_animation_finished(anim_name) -> void:
	queue_free()

func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("Dissapear")
	sleeping = true
