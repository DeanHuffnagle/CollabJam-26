extends State

class_name BuildingFollowCursorState

@export var building: Node2D
@onready var snap_points_node = building.get_node("SnapPoints")
var snap_points_list: Array[SnapPoint] = []
var can_snap = false

func enter():
	can_snap = false
	var mouse_pos = get_viewport().get_mouse_position()
	
	for point in snap_points_node.get_children():
		if point is SnapPoint:
			snap_points_list.append(point)
		
	for snap_point in snap_points_list:
		snap_point.snap_overlap.connect(on_snap_overlap.bind(snap_point))
	
	
func exit():		
	for snap_point in snap_points_list:
		snap_point.snap_overlap.disconnect(on_snap_overlap.bind(snap_point))
	snap_points_list.clear()
	can_snap = false
		

func update(delta: float):
	var mouse_pos = get_viewport().get_mouse_position()
	building.global_position = mouse_pos
	can_snap = true
		

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("building_place"):
		state_machine.change_state("buildingstationarystate")
	
	
func on_snap_overlap(target_snap_point:SnapPoint, this_snap_point:SnapPoint):
		if can_snap and compare_snap_compatibility(this_snap_point,target_snap_point):
			state_machine.change_state("buildingsnappedstate")
	
	
func compare_snap_compatibility(snap_point_1:SnapPoint, snap_point_2:SnapPoint) -> bool:
	var snap_point_1_rotation_in_degrees = snap_point_1.rotation_degrees
	var snap_point_2_rotation_degrees = snap_point_2.rotation_degrees
	var difference = snap_point_1_rotation_in_degrees-snap_point_2_rotation_degrees
	if is_close_enough(difference):
		return true
	else:
		return false


func is_close_enough(difference: float) -> bool:
	if difference < -179 and difference > -181:
		return(true)
	elif difference > 179 and difference < 181:
		return(true)
	else: 
		return(false)
	
