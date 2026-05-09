"""Probably the best microgame in this project"""
extends MicroGame

const SPEED: float = 1.0 * (2 ** 7)
	
func _process(delta: float) -> void:
	$Godot.position += delta * Vector2.LEFT * SPEED
	$Godot.rotate(-.05)
	
	if $Godot.position.x < 0:
		ended.emit()
		
	
