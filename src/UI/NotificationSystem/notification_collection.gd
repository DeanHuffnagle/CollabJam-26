extends NodeCollection
class_name NotificationCollection

func _ready() -> void:
	NotificationManager.new_notification.connect(_on_new_notification)
	add_to_group("NotificationCollection")

func _on_new_notification(notification: Notification):
	add_child(notification)
