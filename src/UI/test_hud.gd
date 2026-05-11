extends Node

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		NotificationManager.on_turret_break(event.position)
