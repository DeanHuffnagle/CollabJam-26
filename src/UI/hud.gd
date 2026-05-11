extends Control

func _ready() -> void:
	connect_preloads()
	
func connect_preloads() -> void:
	NotificationManager.new_notification.connect(_on_new_button)
	MicrogameManager.micro_game_start.connect(_on_new_microgame)
	
func _on_new_button(notification: Notification):
	add_child(notification)

func _on_new_microgame(microgame_window: MicroGameWindow):
	add_child(microgame_window)
