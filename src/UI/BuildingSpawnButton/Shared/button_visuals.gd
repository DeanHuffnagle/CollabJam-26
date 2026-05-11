extends NodeCollection
class_name ButtonVisuals

@onready var button: AnimatedSprite2D = $Button
@onready var icon: AnimatedSprite2D = $Icon


	
func frame_enabled():
	button.play("button_enabled")
	icon.play("frame_enabled")
	
func frame_disabled():
	button.play("button_disabled")
	icon.play("frame_disabled")
	
func laser_enabled():
	button.play("button_enabled")
	icon.play("laser_enabled")

func laser_disabled():
	button.play("button_disabled")
	icon.play("laser_disabled")
	
func solar_panel_enabled():
	button.play("button_enabled")
	icon.play("solar_panel_enabled")
	
func solar_panel_disabled():
	button.play("button_disabled")
	icon.play("solar_panel_disabled")
	
func emp_enabled():
	button.play("button_enabled")
	icon.play("emp_enabled")

func emp_disabled():
	button.play("button_disabled")
	icon.play("emp_disabled")
	
func rocket_enabled():
	button.play("button_enabled")
	icon.play("rocket_enabled")

func rocket_disabled():
	button.play("button_disabled")
	icon.play("rocket_disabled")
	
