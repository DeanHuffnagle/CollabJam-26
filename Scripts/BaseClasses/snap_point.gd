@icon("res://Assets/Icons/magnet.png")
extends Area2D
class_name SnapPoint

signal snap_overlap

func _process(delta: float) -> void:
	for area in get_overlapping_areas():
		if area is SnapPoint:
			if compare_snap_direction_compatibility(self, area):
				emit_signal("snap_overlap", area)
	
func compare_snap_direction_compatibility(snap_point_1:SnapPoint, snap_point_2:SnapPoint) -> bool:
	var snap_point_1_rotation_in_degrees = snap_point_1.rotation_degrees
	var snap_point_2_rotation_degrees = snap_point_2.rotation_degrees
	var difference = snap_point_1_rotation_in_degrees-snap_point_2_rotation_degrees
	if is_close_enough_to_180_degrees(difference):
		return true
	else:
		return false

func is_close_enough_to_180_degrees(difference: float) -> bool:
	if difference < -179 and difference > -181:
		return(true)
	elif difference > 179 and difference < 181:
		return(true)
	else: 
		return(false)
