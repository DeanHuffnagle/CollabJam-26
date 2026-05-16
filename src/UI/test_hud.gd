extends Node

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		NotificationManager._on_tower_break(event.position, Callable())
