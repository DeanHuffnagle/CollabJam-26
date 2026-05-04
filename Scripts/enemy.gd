#Base Enemy Behavior Script (Pathfinding, Health[TBD])
extends CharacterBody2D

@export var moveSpeed = 20.0
@onready var target = get_tree().get_first_node_in_group("buildings") #Target the first thing on the buildings list, can make fancier later

func _physics_process(_delta):
	var moveVector = global_position.direction_to(target.global_position)
	velocity = moveVector * moveSpeed
	move_and_slide()
