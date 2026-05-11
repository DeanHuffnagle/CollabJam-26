extends BuildingSpawnButton
class_name SolarPanelSpawnButton

func _ready():
	super()

func handle_display_active():
	visuals.solar_panel_enabled()
	
func handle_display_inactive():
	visuals.solar_panel_disabled()
