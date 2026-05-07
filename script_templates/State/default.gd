extends State

class_name ExampleState

func enter():
	# Use this to initialize any variables or connect to any signals that will be used while in this state.
	pass
	
func exit():
	# Use this to cleanup any variables that you set during the time this state was active.
	pass	

func update(delta: float):
	# This runs once every frame should be used for non physics processes.
	pass
	
func physics_update(delta: float):
	# This runs once every frame should be used for non physics processes.
	pass

func handle_input(event: InputEvent):
	# This runs after an input event, this should only contain an if statement.
	# All actual logic should be in a seperate function. 
	pass
	
