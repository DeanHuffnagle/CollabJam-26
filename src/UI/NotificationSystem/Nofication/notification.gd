extends Control

class_name Notification

func set_params(handler: Callable, turret_type: String) -> void:
	set_pressed_handler(handler)
	set_notifcation_type(turret_type)

func set_pressed_handler(handler: Callable) -> void:
	%Button.pressed.connect(handler)

func set_notifcation_type(turret_type: String) -> void:
	%Body.play(turret_type)
	if turret_type == "upgrade":
		%Box.alignment = %Box.ALIGNMENT_END
	elif turret_type == "repair":
		pass
	else:
		pass # bad

func _ready() -> void:
	$AudioStreamPlayer2D.play()
