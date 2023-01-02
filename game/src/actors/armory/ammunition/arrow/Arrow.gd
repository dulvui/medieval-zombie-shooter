extends RigidBody2D

const SPEED:float = 360.0

var target

func shoot(target:Vector2) -> void:
	var direction = -(global_position - target).normalized()
	apply_central_impulse(Vector2(direction.x, direction.y) * SPEED)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_HitDetector_body_entered(body) -> void:
	$AnimationPlayer.play("Dissapear")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

