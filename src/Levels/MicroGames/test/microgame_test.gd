extends Node2D

func _ready() -> void:
	$Button.pressed.connect(MicrogameManager._on_game_start)
	MicrogameManager.micro_game_start.connect(display_microgame)

func display_microgame(microgame_window: MicroGameWindow):
	add_child(microgame_window)
