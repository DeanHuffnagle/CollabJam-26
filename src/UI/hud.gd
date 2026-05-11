extends Control

func _ready() -> void:
	connect_preloads()
	
func connect_preloads() -> void:
	NotificationManager.new_notification.connect(_on_new_button)
	
func _on_new_button(notification: Notification):
	add_child(notification)
	
