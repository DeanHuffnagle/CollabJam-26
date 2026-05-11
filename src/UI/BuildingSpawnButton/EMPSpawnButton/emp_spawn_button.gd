extends BuildingSpawnButton
class_name EMPSpawnButton

func _ready():
	super()

func handle_display_active():
	visuals.emp_enabled()
	
func handle_display_inactive():
	visuals.emp_disabled()
