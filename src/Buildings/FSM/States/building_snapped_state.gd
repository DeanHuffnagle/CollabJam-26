extends BuildingState
class_name BuildingSnappedState

@export var snap_strength: float = 20
@onready var snap_points_container: SnapPointCollection
var snap_points_list: Array[SnapPoint] = []
var target_snap_point: SnapPoint
var active_snap_point: SnapPoint
var colliding: bool

func enter():
	super()
	snap_points_container = building.get_node("SnapPointCollection")
	for point in snap_points_container.get_children():
		if point is SnapPoint:
			snap_points_list.append(point)
		
	for snap_point in snap_points_list:
		snap_point.snap_overlap.connect(on_snap_overlap.bind(snap_point))
	
func exit():
	for snap_point in snap_points_list:
		snap_point.snap_overlap.disconnect(on_snap_overlap.bind(snap_point))
	snap_points_list.clear()
	target_snap_point = null
	active_snap_point = null
	building.modulate = Color.WHITE
		
func update(delta: float):
	handle_collision()
	handle_color_indicator()
	handle_snap_to_point()
	handle_disengage_snap()
	
		
func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("building_place"):
		handle_place_building()
			
func on_snap_overlap(target:SnapPoint, this_snap_point:SnapPoint):
		target_snap_point = target
		active_snap_point = this_snap_point
	
func handle_snap_to_point() -> void:
	if active_snap_point and target_snap_point:
		var offset = building.global_position - active_snap_point.global_position
		var target_position = target_snap_point.global_position + offset
		building.global_position = target_position
	
func check_for_mouse_distance() -> float:
	var mouse_pos = get_global_mouse_position()
	var distance: Vector2 = (building.global_position - mouse_pos)
	return distance.length()

func handle_disengage_snap() -> void:
	var distance = check_for_mouse_distance()
	if distance > snap_strength:
		state_machine.change_state("buildingfollowcursorstate")
	
func handle_place_building() -> void:
	if not colliding:
		Global.placing_building = false
		state_machine.change_state("buildingstationarystate")
		

func handle_color_indicator():
	if colliding:
		building.modulate = Color.RED
	else:
		building.modulate = Color.GREEN

func handle_collision() -> void:
	if building.collider.is_empty:
		colliding = false
	else:
		colliding = true
