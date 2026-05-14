@icon("res://Assets/Icons/cannon.png")
extends Node2D

class_name AreaOfEffectEmitter


@export var area_of_effect_scene: PackedScene
@onready var collection: AreaOfEffectCollection= get_tree().get_first_node_in_group("AreaOfEffectCollection")

func emit_area_of_effect():
	if  !collection:
		collection = get_tree().get_first_node_in_group("AreaOfEffectCollection")
	var area_of_effect: AreaOfEffect = area_of_effect_scene.instantiate()
	area_of_effect.global_position = self.global_position
	collection.add_child(area_of_effect)
