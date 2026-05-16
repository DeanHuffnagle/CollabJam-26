extends Node2D
class_name EnergySpawner


@export var energy_scene: PackedScene
@export var tower: Tower
@onready var projectile_collection: ProjectileCollection = get_tree().get_first_node_in_group("ProjectileCollection")


func spawn_energy(value:int):
	if tower.is_active:
		if !projectile_collection:
			projectile_collection = get_tree().get_first_node_in_group("ProjectileCollection")
		var energy = energy_scene.instantiate()
		energy.value = value
		projectile_collection.add_child(energy)
		energy.global_position = self.global_position

	
