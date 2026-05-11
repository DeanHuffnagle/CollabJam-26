extends BuildingSpawnButton
class_name FrameSpawnButton

func _ready():
	super()

func handle_display_active():
	visuals.frame_enabled()
	
func handle_display_inactive():
	visuals.frame_disabled()
