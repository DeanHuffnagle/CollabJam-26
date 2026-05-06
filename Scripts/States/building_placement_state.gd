extends State

class_name BuildingPlacementState

@export var building: Node2D
@onready var snap_points_node = building.get_node("SnapPoints")
var snap_points_list: Array[SnapPoint] = []


func enter():
	print("entered placement state")
	for point in snap_points_node.get_children():
		if point is SnapPoint:
			snap_points_list.append(point)
		
	for snap_point in snap_points_list:
		snap_point.area_entered.connect(on_snap_point_area_entered.bind(snap_point))
	
	
func exit():
	pass	

func update(delta: float):
	var mouse_pos = get_viewport().get_mouse_position()
	building.global_position = mouse_pos
		
func physics_update(delta: float):
	pass

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("building_place"):
		state_machine.change_state("buildingstationarystate")
	
func on_snap_point_area_entered(area, snap_point):
	print(area)
	print(snap_point)
