extends State

class_name BuildingState

var building_state_machine: BuildingStateMachine
var building: Building


func enter():
	building_state_machine = get_state_machine()
	building = building_state_machine.building

func get_state_machine() -> BuildingStateMachine:
	return state_machine as BuildingStateMachine
