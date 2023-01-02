extends Node2D

const ARROW = preload("res://src/actors/armory/ammunition/arrow/Arrow.tscn")

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var reload_timer: Timer = $ReloadTimer

var arrow:RigidBody2D
var shooting:bool = false
var target:Vector2 = Vector2.ZERO


func _input(event) -> void:
	if not shooting and event is InputEventScreenTouch:
		if event.pressed:
			animation_player.play("Charge")
		else:
			shooting = true
			animation_player.play("Shoot")
			target = event.position
	


func _on_AnimationPlayer_animation_finished(anim_name) -> void:
	if anim_name == "Shoot":
		arrow = ARROW.instance()
		add_child(arrow)
		arrow.shoot(target)
		shooting = false
