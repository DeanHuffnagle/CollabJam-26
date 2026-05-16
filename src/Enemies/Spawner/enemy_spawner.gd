@icon("res://Assets/Icons/cannon.png")
extends Node2D

class_name EnemySpawner


var spawnTimer: Timer


@export var enemy_scene: PackedScene
@onready var enemy_collection: EnemyCollection = get_tree().get_first_node_in_group("EnemyCollection")

func spawn():
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.global_position = self.global_position
	enemy_collection.add_child(enemy)
	return true
