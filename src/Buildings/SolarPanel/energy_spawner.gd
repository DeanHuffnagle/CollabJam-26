extends Node2D
class_name EnergySpawner


@export var energy_scene: PackedScene
@export var tower: Tower
@onready var projectile_collection: ProjectileCollection = get_tree().get_first_node_in_group("ProjectileCollection")


func spawn_energy():
	if tower.is_active:
		var energy = energy_scene.instantiate()
		projectile_collection.add_child(energy)
		energy.global_position = self.global_position

	
