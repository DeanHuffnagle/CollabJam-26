extends State
class_name BuildingStationaryState

@export var building: Building

func enter():
	
	building.emit_signal("on_placed")
