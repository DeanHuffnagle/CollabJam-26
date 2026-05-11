@icon("res://Assets/Icons/tower.png")
extends CharacterBody2D
class_name Tower

@export var building: Building
@export var vison_radius: float
@export var is_active: bool

func _process(_delta):
	is_active = building.is_active
