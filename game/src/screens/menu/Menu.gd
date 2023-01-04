extends Control


func _ready() -> void:
	if OS.get_name() == "iOS":
		$Buttons/Exit.hide()

func _on_Play_pressed() -> void:
	get_tree().change_scene("res://src/screens/game/Game.tscn")


func _on_Exit_pressed():
	get_tree().quit()
