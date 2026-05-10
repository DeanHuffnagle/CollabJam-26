extends Node

@export var starting_energy: int = 10
@export var min_energy: int = 0
@export var max_energy: int = 50
@onready var current_energy: int = starting_energy
	
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
