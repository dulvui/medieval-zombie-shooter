extends Node2D

const SPEED:float = 0.5
const TRANS = Tween.TRANS_LINEAR
const EASE = Tween.EASE_OUT

onready var animation_player = $AnimationPlayer
onready var tween = $Tween 

var target

func shoot(target:Vector2) -> void:
	self.target = target
	animation_player.play("Shoot")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	tween.interpolate_property(self, "global_position", global_position, target, SPEED, TRANS, EASE)
	tween.start()


func _on_HitDetector_body_entered(body):
	pass # Replace with function body.
