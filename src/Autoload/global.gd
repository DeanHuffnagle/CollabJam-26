extends Node

var placing_building = false
@export var starting_energy: int = 25
@export var min_energy: int = 0
@export var max_energy: int = 50
@onready var current_energy: int = starting_energy
@export var enemy_move_speed: int = 2000
@export var move_speed_increment = 100
func add_energy(amount: int):
	var calculated_energy = current_energy + amount
	if calculated_energy > max_energy:
		current_energy = max_energy
	else:
		current_energy = calculated_energy
	
func remove_energy(amount: int):
	var calculated_energy = current_energy - amount
	if calculated_energy < min_energy:
		current_energy = min_energy
	else:
		current_energy = calculated_energy

func game_over():
	get_tree().quit()

func increase_enemy_move_speed():
	enemy_move_speed = enemy_move_speed + move_speed_increment
