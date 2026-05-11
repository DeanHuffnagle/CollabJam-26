extends BuildingSpawnButton
class_name SAMLauncherSpawnButton

func _ready():
	super()

func handle_display_active():
	visuals.rocket_enabled()
	
func handle_display_inactive():
	visuals.rocket_disabled()
