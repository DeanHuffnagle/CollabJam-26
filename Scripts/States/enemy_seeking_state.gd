extends State

class_name EnemySeekingState

func enter():
	print("entering seeking state")
	var enemy = state_machine.get_parent()
	var target = get_tree().get_nodes_in_group("buildings").pick_random() #get random target from buildings group, we probably just have to keep a global array of buildings?

#func update():
	#if enemy.HitBox signal stuff here:
	#	state_machine.change_state("EnemyAttackingState")

func physics_update(delta: float):
	var moveVector = enemy.global_position.direction_to(target.global_position)
	enemy.velocity = moveVector * enemy.moveSpeed
	enemy.move_and_slide()
