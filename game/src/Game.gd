extends Node2D

const ZOMBIE = preload("res://src/actors/zombies/Zombie.tscn")

# defines how far away the zombie can spawn outside of the screen
const SCREEN_MARGIN = 50

func _ready() -> void:
	randomize()

func _on_Timer_timeout() -> void:
	_spawn_zombie()


func _spawn_zombie() -> void:
	var zombie = ZOMBIE.instance()
	
	# pick random outside screen position on top, left, right or bottom
	match(randi() % 4):
		0:
			zombie.position = Vector2(rand_range( - SCREEN_MARGIN , Global.SCREEN_WIDTH + SCREEN_MARGIN), rand_range(- SCREEN_MARGIN , 0))
		1:
			zombie.position = Vector2(rand_range( - SCREEN_MARGIN , Global.SCREEN_WIDTH + SCREEN_MARGIN), rand_range(Global.SCREEN_HEIGHT , Global.SCREEN_HEIGHT + SCREEN_MARGIN))
		2:
			zombie.position = Vector2(rand_range( - SCREEN_MARGIN , 0 ), rand_range(0  , Global.SCREEN_HEIGHT ))
		_:
			zombie.position = Vector2(rand_range( Global.SCREEN_WIDTH, Global.SCREEN_WIDTH + SCREEN_MARGIN),rand_range(0  , Global.SCREEN_HEIGHT ))
		
	add_child(zombie)
