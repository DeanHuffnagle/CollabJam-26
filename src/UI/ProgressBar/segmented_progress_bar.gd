extends VBoxContainer
class_name SegmentedProgressBar

@export var pips_per_segment: int = 5

func _process(delta):
	display()

func display():
	var remaining_energy = Global.current_energy
	for child in get_children():
		if child is TextureProgressBar:
			child.value = remaining_energy
			remaining_energy -= pips_per_segment
		
