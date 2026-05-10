extends TextureButton
class_name BuildingSpawnButton

@onready var button = $Button
@onready var icon = $Icon

var active: bool = false
@export var energy_cost: int = 10
@export var spawns_frame: bool
@export var spawns_laser_tower: bool
@export var spawns_solar_panel: bool
@export var spawns_rocket_launcher: bool
#@export var spawns_emp: bool
@export var building_scene: PackedScene
@onready var building_collection: BuildingCollection = get_tree().get_first_node_in_group("BuildingCollection")

func _process(_delta):
	determine_if_active()
	if active:
		handle_display_active()
	else:
		handle_display_inactive()
	
	

func _on_pressed() -> void:
	var building = building_scene.instantiate()
	building.position = self.position
	building.get_node("BuildingStateMachine").initial_state = building.get_node("BuildingStateMachine/BuildingFollowCursorState")
	building_collection.add_child(building)
	Global.remove_energy(energy_cost)
	

func handle_display_active():
	button.play("button_enabled")
	if spawns_frame:
		icon.play("frame_enabled")
	elif spawns_laser_tower:
		icon.play("laser_enabled")
	elif spawns_solar_panel:
			icon.play("solar_panel_enabled")
	elif spawns_rocket_launcher:
		icon.play("rocket_enabled")
	
	
	
	
	
func handle_display_inactive():
	button.play("button_disabled")
	if spawns_frame:
		icon.play("frame_disabled")
	elif spawns_laser_tower:
		icon.play("laser_disabled")
	elif spawns_solar_panel:
			icon.play("solar_panel_disabled")
	elif spawns_rocket_launcher:
		icon.play("rocket_disabled")
	
func determine_if_active():
	if Global.current_energy >= energy_cost:
		active = true
	else:
		active = false
