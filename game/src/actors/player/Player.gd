extends Node2D


func _input(event) -> void:
	if event is InputEventScreenDrag or event is InputEventScreenTouch:
		$RotatingPart.look_at(event.position)
