extends Node2D

signal zombie_entered
signal zombie_died
signal human_saved

func _on_ZombieDetector_body_entered(body) -> void:
	emit_signal("zombie_entered")


func _on_ZombieDetector_body_exited(body) -> void:
	emit_signal("zombie_died")


func _on_HumanDetector_body_entered(body) -> void:
	emit_signal("human_saved")
