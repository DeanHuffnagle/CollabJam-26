extends Resource
class_name FloatSlider

@export_range(-10, 10, 1) var big: float = 0
@export_range(0, 1, 0.01) var small: float = 1
	
@export var value: float: 
	get: return small * (2 ** big)
