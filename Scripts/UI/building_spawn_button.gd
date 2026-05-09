extends Button
class_name BuildingSpawnButton

@export var building_scene: PackedScene
@onready var building_collection: BuildingCollection = get_tree().get_first_node_in_group("BuildingCollection")

func _on_pressed() -> void:
	var building = building_scene.instantiate()
	building.position = self.position
	building.get_node("BuildingStateMachine").initial_state = building.get_node("BuildingStateMachine/BuildingFollowCursorState")
	building_collection.add_child(building)
	self.release_focus()
