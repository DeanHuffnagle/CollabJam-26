extends State

class_name EnemySeekingState
var target: Node2D
@export var enemy: Enemy
@export var hitBox: HitBox
@export var moveSpeed: float
signal TargetWithinRange

func enter():
	print("entering seeking state")
	target = get_tree().get_nodes_in_group("buildings").pick_random() #get random target from buildings group, we probably just have to keep a global array of buildings?
	hitBox.target_detected.connect(on_target_detected.bind(hitBox))

func exit():
	hitBox.target_detected.disconnect(on_target_detected.bind(hitBox))
	target = null
	
func physics_update(delta: float):
		var moveVector = enemy.global_position.direction_to(target.global_position)
		enemy.velocity = moveVector * enemy.moveSpeed
		enemy.move_and_slide()
	
func on_target_detected(hurtBox, hitBox):
	state_machine.change_state("enemyattackingstate")
