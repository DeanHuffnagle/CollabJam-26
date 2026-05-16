extends FiniteStateMachine

class_name TowerStateMachine

@export var tower: Tower

signal broken_state(state: State)

func _ready() -> void:
	super()
	changed_state.connect(on_changed_state)

func on_changed_state(state: State):
	if "broken" in state.name.to_lower():
		broken_state.emit(state)
	 
