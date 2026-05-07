@icon("res://Assets/Icons/overlap.png")
extends Area2D
class_name OverlapDetector

var is_empty = true
var overlap_count = 0

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _on_area_entered(area: Area2D) -> void:
	if area is OverlapDetector:
		overlap_count += 1
		is_empty = false

func _on_area_exited(area: Area2D) -> void:
	if area is OverlapDetector:
		overlap_count -= 1
		if overlap_count == 0:
			is_empty = true
