extends Control

class_name Notification

func set_pressed_handler(handler: Callable) -> void:
	$NotificationBody.pressed.connect(handler)
