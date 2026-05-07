extends State

class_name BuildingSnappedState

@export var snap_strength: float = 20
@export var building: Node2D
@onready var snap_points_node = building.get_node("SnapPoints")
var snap_points_list: Array[SnapPoint] = []
var target_snap_point: SnapPoint
var active_snap_point: SnapPoint



func enter():
	for point in snap_points_node.get_children():
		if point is SnapPoint:
			snap_points_list.append(point)
		
	for snap_point in snap_points_list:
		snap_point.snap_overlap.connect(on_snap_overlap.bind(snap_point))
	
	
func exit():
	for snap_point in snap_points_list:
		snap_point.snap_overlap.disconnect(on_snap_overlap.bind(snap_point))
	snap_points_list.clear()
		
func update(delta: float):
		if active_snap_point and target_snap_point:
			snap_to_point()
		disengage_snap()
		
func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("building_place"):
		state_machine.change_state("buildingstationarystate")
			

func on_snap_overlap(target:SnapPoint, this_snap_point:SnapPoint):
		target_snap_point = target
		active_snap_point = this_snap_point
	
	
func snap_to_point():
	var offset = building.global_position - active_snap_point.global_position
	var target_position = target_snap_point.global_position + offset
	building.global_position = target_position
	
func check_for_mouse_distance() -> float:
	var mouse_pos = get_viewport().get_mouse_position()
	var distance: Vector2 = (building.global_position - mouse_pos)
	return distance.length()

func disengage_snap() -> void:
	var distance = check_for_mouse_distance()
	print(distance)
	if distance > snap_strength:
		print(true)
		state_machine.change_state("buildingfollowcursorstate")
		
