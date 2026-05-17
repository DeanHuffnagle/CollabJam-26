@icon("res://Assets/Icons/building.png")
extends CharacterBody2D
class_name TowerBase

@export var tower: Tower 
var kill_count: int = 0
@export var max_kill_count = 100
var launcher_collection: LauncherCollection
@export var kill_count_scaling: int  = 2


func _ready() -> void:
	tower.upgraded.connect(_on_upgrade_completed)
	launcher_collection = tower.get_node("LauncherCollection")
	tower.killed_enemy.connect(_on_enemy_killed)


func trigger_upgrade_notification():
	if tower.current_rank < tower.max_rank:
		tower.emit_upgrade_signal()
	
func increase_kill_count():
	if kill_count < max_kill_count:
		kill_count +=1
	else: kill_count = max_kill_count
	
func reset_kill_count():
	kill_count = 0
	max_kill_count = max_kill_count * kill_count_scaling
	
func _on_upgrade_completed():
	reset_kill_count()

		
func _on_enemy_killed():
	increase_kill_count()
