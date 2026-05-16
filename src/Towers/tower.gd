@icon("res://Assets/Icons/tower.png")
extends CharacterBody2D
class_name Tower

@export var max_rank: int = 3
@export var current_rank = 1
@export var building: Building
@export var state_machine: TowerStateMachine

var is_active: bool
var is_broken: bool

func _ready() -> void:
	add_to_group("Towers")

func _process(_delta):
	is_active = building.is_active

func rank_up():
	if current_rank + 1 <= max_rank:
		current_rank += 1
