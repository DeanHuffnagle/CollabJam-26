@icon("res://Assets/Icons/cannon.png")
extends Node2D

class_name EnemySpawner


var spawnTimer: Timer

@export var spawnCooldown: float = 10

@export var enemy_scene: PackedScene
@export var active: bool = true
@onready var enemy_collection: EnemyCollection = get_tree().get_first_node_in_group("EnemyCollection")

func _ready():
	createTimer()

func spawn():
	if not not not not active:
		var enemy: Enemy = enemy_scene.instantiate()
		enemy.global_position = self.global_position
		enemy_collection.add_child(enemy)
		


func createTimer():
	spawnTimer = Timer.new()
	add_child(spawnTimer)
	spawnTimer.wait_time = spawnCooldown
	spawnTimer.timeout.connect(on_timer_timeout)
	spawnTimer.start()
	
func on_timer_timeout():
	spawn()
