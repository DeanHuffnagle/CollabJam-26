extends Button
class_name BuildingSpawnButton

@export var building_scene: PackedScene

func _on_pressed() -> void:
	var building = building_scene.instantiate()
	building.position = self.position
	building.get_node("FiniteStateMachine").initial_state = building.get_node("FiniteStateMachine/BuildingFollowCursorState")
	get_tree().current_scene.add_child(building)
	self.release_focus()
