@icon("res://Assets/Icons/building.png")
extends CharacterBody2D
class_name TowerBase

@export var tower: Tower 
var kill_count: int = 0
@export var max_kill_count = 40

func _ready() -> void:
	tower.upgraded.connect(_on_upgrade_completed)


func _process(delta):
	increase_kill_count()

func trigger_upgrade_notification():
	tower.emit_upgrade_signal()
	
func increase_kill_count():
	if kill_count < max_kill_count:
		kill_count +=1
	else: kill_count = max_kill_count
	
func reset_kill_count():
	kill_count = 0
	
func _on_upgrade_completed():
	reset_kill_count()
