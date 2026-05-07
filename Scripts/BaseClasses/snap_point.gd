extends Area2D

class_name SnapPoint

signal snap_overlap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent=get_parent()
	print(parent)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for area in get_overlapping_areas():
		if area is SnapPoint:
			emit_signal("snap_overlap", area)
