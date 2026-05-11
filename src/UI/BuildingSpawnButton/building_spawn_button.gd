extends TextureButton
class_name BuildingSpawnButton

@onready var visuals: ButtonVisuals = $ButtonVisuals
var active: bool = false
@export var energy_cost: int = 10
@export var building_scene: PackedScene
@onready var building_collection: BuildingCollection = get_tree().get_first_node_in_group("BuildingCollection")


func _ready():
	self.pressed.connect(_on_pressed)
	
func _process(_delta):
	determine_if_active()
	if active:
		handle_display_active()
	else:
		handle_display_inactive()

func _on_pressed() -> void:
	if active && not Global.placing_building:
		Global.placing_building = true
		var building = building_scene.instantiate()
		building.position = self.position
		if not building_collection:
			building_collection = get_tree().get_first_node_in_group("BuildingCollection")
		building.get_node("BuildingStateMachine").initial_state = building.get_node("BuildingStateMachine/BuildingFollowCursorState")
		building_collection.add_child(building)
		Global.remove_energy(energy_cost)
	

func handle_display_active():
	pass
	
func handle_display_inactive():
	pass
	
func determine_if_active():
	if Global.current_energy >= energy_cost:
		active = true
	else:
		active = false
