extends Control

signal start_minigame

const TEXTURE = preload("res://Assets/icon.svg")

func on_turret_break(turret_position: Vector2) -> void:
	var button = TextureButton.new()
	button.texture_normal = TEXTURE
	button.position = turret_position
	button.pressed.connect(on_button_press.bind(button))
	add_child(button)

func on_button_press(button: TextureButton) -> void:
	start_minigame.emit()
	button.queue_free()
