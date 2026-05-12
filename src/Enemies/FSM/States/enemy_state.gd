extends State
class_name EnemyState

var enemy_state_machine: EnemyStateMachine
var enemy: Enemy


func enter():
	enemy_state_machine = get_state_machine()
	enemy = enemy_state_machine.enemy

func get_state_machine() -> EnemyStateMachine:
	return state_machine as EnemyStateMachine
