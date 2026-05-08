extends Node

class_name ProjectileLauncher


@export var projectile_scene: PackedScene
@export var directional_ray: RayCast2D
@export var active: bool
@export var projectile_collection: NodeCollection

func fire():
	var projectile = projectile_scene.instantiate()
	projectile.position = self.position
	projectile.direction = directional_ray
	projectile_collection.add_child(projectile)
