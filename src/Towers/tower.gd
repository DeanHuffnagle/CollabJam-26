@icon("res://Assets/Icons/tower.png")
extends CharacterBody2D
class_name Tower

@export var max_rank: int = 3
@export var current_rank = 1
@export var building: Building
@export var state_machine: TowerStateMachine

var is_active: bool
var is_broken: bool
signal upgraded
signal tower_break(tower_position: Vector2, repair_handler: Callable)
signal killed_enemy

func _ready() -> void:
	# Subcribe to broken tower state
	state_machine.broken_state.connect(_on_broken_state)
	
	# Broadcast to Notification manager
	tower_break.connect(NotificationManager._on_tower_break)
	add_to_group("Towers")
	
func _process(_delta):
	is_active = building.is_active

func rank_up():
	if current_rank < max_rank:
		current_rank += 1
		upgraded.emit()

func _on_broken_state(state: State) -> void:
	tower_break.emit(global_position, state.repair)

func emit_upgrade_signal():
	tower_break.emit(global_position, self.rank_up)
	
