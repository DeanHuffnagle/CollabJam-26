@icon("res://Assets/Icons/radar.png")
extends Area2D
class_name EnemyDetectionField

var enemy_array: Array[Enemy] = []
var enemies_present: bool = false
signal enemy_detected(body: Enemy)
@onready var tower: Tower = $".."
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D):
	if body is Enemy:
		enemy_array.append(body)
		enemies_present = true
		body.tree_exiting.connect(_on_enemy_removed.bind(body))
		emit_signal("enemy_detected", body)

func _on_body_exited(body: Node2D):
	if body is Enemy:
		_on_enemy_removed(body)

func _on_enemy_removed(body: Node2D):
	enemy_array.erase(body)
	enemies_present = not enemy_array.is_empty()
	if body.tree_exiting.is_connected(_on_enemy_removed):
		body.tree_exiting.disconnect(_on_enemy_removed.bind(body))
