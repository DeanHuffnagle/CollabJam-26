# chris testing 1,2,3 testing
extends State

class_name ExampleState

func enter():
	print("entering example state")
	
func handle_input(event: InputEvent):
	print(event)
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("examplestate")
