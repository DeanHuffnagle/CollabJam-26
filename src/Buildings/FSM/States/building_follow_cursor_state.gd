extends BuildingState

class_name BuildingFollowCursorState

@onready var snap_points_node: SnapPointCollection
var snap_points_list: Array[SnapPoint] = []
var can_snap: bool

func enter():
	super()
	snap_points_node = building.get_node("SnapPointCollection")
	can_snap = false
	populate_snap_points_list()
	connect_snap_point_signals()
	
func exit():		
	disconnect_snap_point_signals()
	clear_snap_points_list()
	can_snap = false
		
func update(delta: float):
	handle_move_to_mouse_pos()
	can_snap = true
		
func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("building_rotate_CW"):
		rotate_CW()
	if Input.is_action_just_pressed("building_rotate_CCW"):
		rotate_CCW()
	if Input.is_action_just_pressed("building_cancel_placement"):
		building.queue_free()
		Global.add_energy(building.value)
		Global.placing_building = false
	
func on_snap_overlap(target_snap_point:SnapPoint, this_snap_point:SnapPoint):
		if can_snap:
			state_machine.change_state("buildingsnappedstate")
	
func rotate_CCW() -> void:
	building.rotate(deg_to_rad(90))
	
func rotate_CW() -> void:
	building.rotate(deg_to_rad(-90))
	
func handle_move_to_mouse_pos() -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	building.global_position = mouse_pos

func connect_snap_point_signals() -> void:
	for snap_point in snap_points_list:
		snap_point.snap_overlap.connect(on_snap_overlap.bind(snap_point))
	
func disconnect_snap_point_signals() -> void:
	for snap_point in snap_points_list:
		snap_point.snap_overlap.disconnect(on_snap_overlap.bind(snap_point))

func populate_snap_points_list() -> void:
	for point in snap_points_node.get_children():
		if point is SnapPoint:
			snap_points_list.append(point)

func clear_snap_points_list() -> void:
	snap_points_list.clear()
	
