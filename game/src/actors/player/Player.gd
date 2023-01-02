extends Node2D


func _input(event):
	if event is InputEventScreenDrag or event is InputEventScreenTouch:
		look_at(event.position)
