extends Node

const NOTIFICATION_SCENE: PackedScene = preload("res://src/UI/NotificationSystem/Nofication/notification.tscn")

signal new_notification(notification: Notification)

func _on_tower_change(tower_position: Vector2, tower_handler: Callable) -> void:
	var microgame_notification = get_notification(tower_position, tower_handler)
	new_notification.emit(microgame_notification)

func get_notification(tower_position: Vector2, tower_handler: Callable) -> Notification:
	# Set Pressed Handler
	var microgame_notification: Notification = NOTIFICATION_SCENE.instantiate()
	microgame_notification.global_position = tower_position
	
	microgame_notification.set_pressed_handler(
		on_button_press.bind(microgame_notification, tower_handler)
	)
	
	return microgame_notification

func on_button_press(notification: Notification, tower_handler: Callable) -> void:
	MicrogameManager._on_game_start(tower_handler)
	notification.queue_free()
	
