extends Node2D

const ARROW = preload("res://src/actors/armory/ammunition/arrow/Arrow.tscn")

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var reload_timer: Timer = $ReloadTimer

var arrow:Node2D
var shooting:bool = false
var target:Vector2 = Vector2.ZERO

func _ready() -> void:
	arrow = ARROW.instance()
	add_child(arrow)


func _input(event):
	if not shooting and event is InputEventScreenTouch and not event.pressed:
		shooting = true
		arrow.shoot(event.position)
		animation_player.play("Shoot")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Shoot":
		arrow = ARROW.instance()
		arrow.visible = false
		add_child(arrow)
		reload_timer.start()


func _on_ReloadTimer_timeout():
	arrow.visible = true
	shooting = false
	
