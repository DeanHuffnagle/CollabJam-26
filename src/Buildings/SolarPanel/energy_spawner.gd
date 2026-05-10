extends Node2D
class_name EnergySpawner

@export var timer_wait_time: float = 3
@export var energy_scene: PackedScene
@export var active: bool = true
@onready var projectile_collection: ProjectileCollection = get_tree().get_first_node_in_group("ProjectileCollection")
var energy_timer: Timer

func _ready() -> void:
	createTimer()
	
func createTimer():
	energy_timer = Timer.new()
	add_child(energy_timer)
	energy_timer.wait_time = timer_wait_time
	energy_timer.timeout.connect(on_timer_timeout)
	energy_timer.start()
	
func on_timer_timeout():
	spawn_energy()
	
func spawn_energy():
	if not active:
		return
	var energy = energy_scene.instantiate()
	projectile_collection.add_child(energy)
	energy.global_position = self.global_position

	
