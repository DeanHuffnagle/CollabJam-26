extends Window

class_name MicroGameWindow

const GLOBAL_RESOLUTION = Vector2i(640, 320)

func set_microgame(microgame: MicroGame):
	size = GLOBAL_RESOLUTION / sqrt(2)
	$SubViewport.add_child(microgame)
