@icon("res://Assets/Icons/radar.png")
extends Area2D
class_name EnemyDetectionField

signal enemy_detected(body:Enemy)

func _process(delta: float) -> void:
		for body in get_overlapping_bodies():
			if body is Enemy:
				emit_signal("enemy_detected", body)
