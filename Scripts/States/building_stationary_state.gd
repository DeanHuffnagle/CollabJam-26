extends BuildingState
class_name BuildingStationaryState


func enter():
	super()
	building.emit_signal("on_placed")
