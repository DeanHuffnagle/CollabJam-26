extends State

class_name EnemyAttackingState

@export var enemy: Node2D

func enter():
	print("entering attacking state")
	var target = enemy.hurtbox
	
func update():
	
