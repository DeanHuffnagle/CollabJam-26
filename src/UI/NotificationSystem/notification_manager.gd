extends Node

const NOTIFICATION_SCENE: PackedScene = preload("res://src/UI/NotificationSystem/Nofication/notification.tscn")

signal new_notification(notification: Notification)

func _on_tower_change(tower_position: Vector2, tower_handler: Callable, type: String) -> void:
	var microgame_notification = get_notification(tower_position, tower_handler, type)
	new_notification.emit(microgame_notification)


func get_notification(tower_position: Vector2, tower_handler: Callable, type: String) -> Notification:
	# Set Pressed Handler
	var microgame_notification: Notification = NOTIFICATION_SCENE.instantiate()
	microgame_notification.global_position = tower_position
	microgame_notification.set_params(
		on_button_press.bind(microgame_notification, tower_handler),
		type
	)
	
	# Set Tower Repair Handler
	
	return microgame_notification

func on_button_press(notification: Notification, tower_handler: Callable) -> void:
	MicrogameManager._on_game_start(tower_handler)
	notification.queue_free()
	
