extends Node

const NOTIFICATION_SCENE: PackedScene = preload("res://src/UI/NotificationSystem/Nofication/notification.tscn")

signal new_notification(notification: Notification)

func on_turret_break(turret_position: Vector2) -> void:
	var microgame_notification = get_notification(turret_position)
	new_notification.emit(microgame_notification)

func get_notification(turret_position: Vector2) -> Notification:
	var microgame_notification: Notification = NOTIFICATION_SCENE.instantiate()
	microgame_notification.position = turret_position
	microgame_notification.set_pressed_handler(on_button_press.bind(microgame_notification))

	return microgame_notification
	

func on_button_press(button: TextureButton) -> void:
	MicrogameManager._on_game_start()
	button.queue_free()
	
