@icon("res://Assets/Icons/cannon.png")
extends Node2D

class_name ProjectileLauncher


@export var projectile_scene: PackedScene
@export var directional_ray: RayCast2D
@export var active: bool
@onready var projectile_collection: ProjectileCollection = get_tree().get_first_node_in_group("ProjectileCollection")


func fire():
	if not active:
		return
	if  !projectile_collection:
		projectile_collection = get_tree().get_first_node_in_group("ProjectileCollection")
	var projectile: Projectile = projectile_scene.instantiate()
	var world_target = directional_ray.to_global(directional_ray.target_position)
	var world_direction = (world_target - global_position).normalized()
	projectile.direction = world_direction
	projectile_collection.add_child(projectile)
	projectile.global_position = self.global_position
	projectile.rotation = world_direction.angle()
	projectile.tower = $"../.."
