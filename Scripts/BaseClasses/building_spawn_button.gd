extends Button
class_name BuildingSpawnButton

@export var building_scene: PackedScene
@export var building_collection: NodeCollection

func _on_pressed() -> void:
	var building = building_scene.instantiate()
	building.position = self.position
	building.get_node("FiniteStateMachine").initial_state = building.get_node("FiniteStateMachine/BuildingFollowCursorState")
	building_collection.add_child(building)
	self.release_focus()
