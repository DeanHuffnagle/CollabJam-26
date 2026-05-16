extends Control

class_name Notification

var end_handler: Callable

func set_pressed_handler(handler: Callable) -> void:
	$NotificationBody.pressed.connect(handler)
