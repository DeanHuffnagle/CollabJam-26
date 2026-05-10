extends Node2D

func _on_computer_mouse_entered() -> void:
	var mouse_v = Input.get_last_mouse_velocity()
	var mouse_p = get_viewport().get_mouse_position()
	
	print_debug("mouse hit", mouse_v) # Replace with function body.
