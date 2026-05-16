extends CanvasLayer

func _ready() -> void:
	connect_preloads()
	
func connect_preloads() -> void:
	MicrogameManager.micro_game_start.connect(_on_new_microgame)
	

func _on_new_microgame(microgame_window: MicroGameWindow):
	add_child(microgame_window)
