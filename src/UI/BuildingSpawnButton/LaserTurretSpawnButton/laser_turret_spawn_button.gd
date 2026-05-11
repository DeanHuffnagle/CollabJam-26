extends BuildingSpawnButton
class_name LaserTurretSpawnButton

func _ready():
	super()
	
func handle_display_active():
	visuals.laser_enabled()
	
func handle_display_inactive():
	visuals.laser_disabled()
