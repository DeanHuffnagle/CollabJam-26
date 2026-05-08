"""Probably the best microgame in this project"""
extends MicroGame

const SPEED: float = 1.0 * (2 ** 8)

func _ready() -> void:
	$Godot.position = get_viewport_rect().size / 2
	
func _process(delta: float) -> void:
	$Godot.position += delta * Vector2.LEFT * SPEED
	
	if $Godot.position.x < 0:
		ended.emit()
		
	
