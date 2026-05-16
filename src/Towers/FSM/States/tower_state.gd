extends State

class_name TowerState

var tower_state_machine: TowerStateMachine
var tower: Tower


func enter():
	super()
	tower_state_machine = get_state_machine()
	tower = tower_state_machine.tower

func get_state_machine() -> TowerStateMachine:
	return state_machine as TowerStateMachine
