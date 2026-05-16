@icon("res://Assets/Icons/tower.png")
extends CharacterBody2D
class_name Tower

@export var max_rank: int = 3
@export var current_rank = 1
@export var building: Building
@export var state_machine: TowerStateMachine

var is_active: bool
var is_broken: bool


signal tower_change(tower_position: Vector2, tower_handler: Callable)

func _ready() -> void:
	# Subcribe to broken tower state
	state_machine.broken_state.connect(_on_broken_state)
	
	# Broadcast to Notification manager
	tower_change.connect(NotificationManager._on_tower_change)
	add_to_group("Towers")

func _process(_delta):
	is_active = building.is_active

func rank_up() -> void:
	if current_rank + 1 <= max_rank:
		current_rank += 1

func _on_rank_up_request() -> void:
	tower_change.emit(global_position, rank_up)

func _on_broken_state(state: State) -> void:
	tower_change.emit(global_position, state.repair)
