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
	var projectile = projectile_scene.instantiate()
	projectile.direction = directional_ray.target_position.normalized()
	projectile_collection.add_child(projectile)
	projectile.global_position = self.global_position
