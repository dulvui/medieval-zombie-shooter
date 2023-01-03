extends Node2D

const ZOMBIE = preload("res://src/actors/characters/zombies/Zombie.tscn")
const HUMAN = preload("res://src/actors/characters/humans/Human.tscn")

# defines how far away the zombie can spawn outside of the screen
const SCREEN_MARGIN = 50

onready var life_bar = $HUD/LifeBar
onready var wave_bar = $HUD/WaveProgressBar
onready var saved_humans_label = $HUD/SavedHumans
onready var carchters = $Charachters

var damage = 0
var saved_humans = 0

func _ready() -> void:
	randomize()

func _on_Timer_timeout() -> void:
	_spawn_zombie()
	_spawn_human()
	life_bar.value -= damage
	
	if life_bar.value <= 0:
		get_tree().change_scene("res://src/screens/menu/Menu.tscn")

func _spawn_zombie():
	# TODO make more zombie types
	_spawn(ZOMBIE.instance())
	wave_bar.value += 1
	
func _spawn_human():
	# TODO make more human types
	_spawn(HUMAN.instance())

func _spawn(character:KinematicBody2D) -> void:
	# pick random outside screen position on top, left, right or bottom
	match(randi() % 4):
		0:
			character.position = Vector2(rand_range( - SCREEN_MARGIN , Global.SCREEN_WIDTH + SCREEN_MARGIN), rand_range(- SCREEN_MARGIN , 0))
		1:
			character.position = Vector2(rand_range( - SCREEN_MARGIN , Global.SCREEN_WIDTH + SCREEN_MARGIN), rand_range(Global.SCREEN_HEIGHT , Global.SCREEN_HEIGHT + SCREEN_MARGIN))
		2:
			character.position = Vector2(rand_range( - SCREEN_MARGIN , 0 ), rand_range(0  , Global.SCREEN_HEIGHT ))
		_:
			character.position = Vector2(rand_range( Global.SCREEN_WIDTH, Global.SCREEN_WIDTH + SCREEN_MARGIN),rand_range(0  , Global.SCREEN_HEIGHT ))
	carchters.add_child(character)



func _on_Castle_zombie_died():
	damage -= 1


func _on_Castle_zombie_entered():
	damage += 1


func _on_Castle_human_saved():
	saved_humans += 1
	saved_humans_label.text = str(saved_humans)
