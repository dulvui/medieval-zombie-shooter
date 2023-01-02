extends Node2D

signal zombie_entered
signal zombie_died

func _on_ZombieDetector_body_entered(body):
	emit_signal("zombie_entered")


func _on_ZombieDetector_body_exited(body):
	emit_signal("zombie_died")
